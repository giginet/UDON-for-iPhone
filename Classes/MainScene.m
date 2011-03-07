//
//  MainScene.m
//  UDON
//
//  Created by giginet on 11/03/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainScene.h"


@implementation MainScene
-(MainScene*) initWithFrame: (CGRect)frame andManager:(GameStateManager*)pManager{
	if(self = [super initWithFrame:frame andManager:pManager]){
		_stage = [[Stage alloc] init];
	}
	
	return self;
}

- (void)update{
	[_stage update];
}

- (void)draw{
	[super draw];
	[_stage draw];
	[self swapBuffers];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event{
	for (UITouch *touch in touches) {
		CGPoint clickPos = [touch locationInView:self];
		if(![_stage mogCheck:clickPos]){
			[_stage.mychara setGoal:clickPos];
		}
		break;
	}
}

@end

