//
//  GLESGameState.m
//  Test_Framework
//
//  Created by Joe Hogue on 4/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GLESGameState.h"
#import <OpenGLES/EAGLDrawable.h>
#import <QuartzCore/QuartzCore.h>
#import "ResourceManager.h"

//for endgame/progression code.
#import "ResourceManager.h" //for getting savefile

//primary context for all opengl calls.  Set in setup2D, should be cleared in teardown.
EAGLContext* gles_context;

//these next 3 vars should really be tied to the state that we get bound to.  Since we only have
//one set of these for now, there is a white flash when changing between two GLESGameStates.
GLuint					gles_framebuffer;
GLuint					gles_renderbuffer;
CGSize					_size;
float _fFactor;

@implementation GLESGameState

+ (Class)layerClass {
    return [CAEAGLLayer class];
}

-(id) initWithFrame:(CGRect)frame andManager:(GameStateManager*)pManager;
{
    if (self = [super initWithFrame:frame andManager:pManager]) {
        // Initialization code
		[self bindLayer];
		endgame_state = 0;
		endgame_complete_time = 0.0f;
    }

	//to account with ScreenRotate
	self.contentMode = UIViewContentModeScaleAspectFit;
    
	return self;
}

//initialize is called automatically before the class gets any other message, per from http://stackoverflow.com/questions/145154/what-does-your-objective-c-singleton-look-like
+ (void)initialize
{
    static BOOL initialized = NO;
    if(!initialized)
    {
        initialized = YES;
		[GLESGameState setup2D];
    }
}

//initialize opengles, and set up the camera for 2d rendering.  This should be called before any other
//opengl calls.
+ (void) setup2D {
	//create and set the gles context.  All opengl calls are done relative to a context, so it
	//is important to set the context before anything else.  
	gles_context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
	[EAGLContext setCurrentContext:gles_context];
	
	glGenRenderbuffersOES(1, &gles_renderbuffer);
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, gles_renderbuffer);
	
	glGenFramebuffersOES(1, &gles_framebuffer);
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, gles_framebuffer);
	glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, gles_renderbuffer);
	
	//Initialize OpenGL states
	glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
	glEnable(GL_BLEND); //most 2d games will want alpha-blending on by default.
	glEnable(GL_TEXTURE_2D);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);
	glEnableClientState(GL_VERTEX_ARRAY);
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);
	
	CGSize					newSize;
	
	float scale = [[UIScreen mainScreen] scale];
	
    GLint iWidth = [UIScreen mainScreen].bounds.size.width * scale;
    GLint iHeight = [UIScreen mainScreen].bounds.size.height * scale;
	//todo: this was originally done in bindToState, since that is where we would get sizing information.  But I
	//couldn't get it to work right when switching between states; I think it messed up the camera.  So it's here
	//for now.  -joe
	newSize = CGSizeMake(iWidth, iHeight) ;//[eaglLayer bounds].size; 
	newSize.width = roundf(newSize.width);
	newSize.height = roundf(newSize.height);
	BOOL isiPn4 = iWidth == 640;
	
	_size = newSize;
	glViewport(0, 0, newSize.width, newSize.height);
	glScissor(0, 0, newSize.width, newSize.height);
	
	
	if( [GameStateManager isPad] || isiPn4){
		_fFactor = MAGNIFICATION_FACTOR_IPAD;
	}
	else{
		_fFactor = MAGNIFICATION_FACTOR_IPHONE;
	}

	//Set up OpenGL projection matrix
	glMatrixMode(GL_PROJECTION);
	glOrthof(0, _size.width * _fFactor, 0, _size.height * _fFactor, -1, 1);
	glMatrixMode(GL_MODELVIEW);
}

//Set our opengl context's output to the underlying gl layer of this gamestate.
//This should be called during the construction of any state that wants to do opengl rendering.
//Only the most recent caller will get opengl rendering.
- (BOOL) bindLayer {
	CAEAGLLayer*			eaglLayer = (CAEAGLLayer*)[self layer];
		
	NSLog(@"layer %@", eaglLayer);
	
	//set up a few drawing properties.  App will run and display without this line, but the properties
	//here should make it go faster.  todo: benchmark this.
	[eaglLayer setDrawableProperties:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO], kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGB565, kEAGLDrawablePropertyColorFormat, nil]];
	
	if(![EAGLContext setCurrentContext:gles_context]) {
		return NO;
	}
	
	//Set background color when rotated
	eaglLayer.backgroundColor = [[UIColor blackColor] CGColor];
	
	//disconnect any existing render storage.  Has no effect if there is no existing storage.
	//I have no idea if this leaks.  I'm pretty sure that this class shouldn't be responsible for
	//freeing the previous eaglLayer, as that should be handled by the view which contains that layer.
	[gles_context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:nil];
	
	//connect our renderbuffer to the eaglLayer's storage.  This allows our opengl stuff to be drawn to
	//the presented layer (and thus, the screen) when presentRenderbuffer is called.
	if(![gles_context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:eaglLayer]) {
		glDeleteRenderbuffersOES(1, &gles_renderbuffer); //probably should exit the app here.
		return NO;
	}
	
	return YES;
}

- (void) startDraw{
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, gles_renderbuffer);
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, gles_framebuffer);
}

//finish opengl calls and send the results to the screen.  should be
//called to end the rendering of a frame.
- (void) swapBuffers
{
	EAGLContext *oldContext = [EAGLContext currentContext];
	GLuint oldRenderbuffer;
	
	if(oldContext != gles_context)
		[EAGLContext setCurrentContext:gles_context];
	
	glGetIntegerv(GL_RENDERBUFFER_BINDING_OES, (GLint *) &oldRenderbuffer);
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, gles_renderbuffer);
	
	//NSLog(@"oldrenderbuffer %d, renderbuffer %d", oldRenderbuffer, _renderbuffer);
	
	glFinish();
	
	if(![gles_context presentRenderbuffer:GL_RENDERBUFFER_OES])
		printf("Failed to swap renderbuffer in %s\n", __FUNCTION__);
	
}

-(void) teardown {
	[gles_context release];
}

-(void) draw{
	glClearColor(0x00/256.0f, 0x00/256.0f, 0x00/256.0f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT);
}

- (void)clean{
	[super clean];
}

@end
