//
//  TitleScene.m
//  UDON
//
//  Created by giginet on 11/03/09.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TitleScene.h"


@implementation TitleScene

- (void)ready{
	_titleImage = [[Sprite alloc] initWithTexture:(NSString *)@"op.jpg"];
	[_titleImage changeDirection:@"left"];
	[g_ResManager playMusic:@"op.mp3"];
}

- (void)draw{
	[super draw];
	[_titleImage draw];
	[self swapBuffers];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event{
	for (UITouch *touch in touches) {
		[_titleImage release];
		[super clean];
		[_manager doStateChange:[MainScene class]];
		break;
	}
}

@end
