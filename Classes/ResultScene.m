//
//  ResultScene.m
//  UDON
//
//  Created by giginet on 11/03/09.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ResultScene.h"
#import "GLESGameState.h"

@implementation ResultScene

- (void)ready{
	_resultImage = [[Sprite alloc] initWithTexture:@"ed.jpg"];
	[_resultImage changeDirection:@"left"];
	_score = [[Number alloc] initWithNumber:gScore andTexture:@"number.png"];
	_score.offset = 3;
	[_score changeDirection:@"left"];
	_score.x = 300;
	_score.y = 200;
}

- (void)draw{
	[super draw];
	[_resultImage draw];
	[_score draw];
	[self swapBuffers];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event{
	for (UITouch *touch in touches) {
		[_resultImage release];
		[super clean];
		[_manager doStateChange:[MainScene class]];
		break;
	}
}

@end
