//
//  MainScene.m
//  UDON
//
//  Created by giginet on 11/03/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainScene.h"


@implementation MainScene

- (void)ready{
	_stage = [[Stage alloc] init];
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
		clickPos = [Coordinate toLeftBottom:clickPos];
		if(![_stage mogCheck:clickPos]){
			[_stage.mychara setGoal:clickPos];
			break;
		}
	}
}

@end

