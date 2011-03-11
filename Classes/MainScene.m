//
//  MainScene.m
//  UDON
//
//  Created by giginet on 11/03/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainScene.h"

int gScore;

@implementation MainScene

- (void)ready{
	_stage = [[Stage alloc] init];
	_bg1 = [[Sprite alloc] initWithTexture:@"bg.jpg"];
	_bg2 = [[Sprite alloc] initWithTexture:@"bg.jpg"];
	_scroll = 0;
	_bg2.x = -1 * BACKGROUNDWIDTH;
	[_bg1 changeDirection:@"left"];
	[_bg2 changeDirection:@"left"];
	[g_ResManager playMusic:@"main.mp3"];
	gScore = 0;
	
	
}

- (void)update{
	[_stage update];
	if([_stage isOver]){
		[_manager doStateChange:[ResultScene class]];
	}
	if(_stage.mychara.hp > 0){
		_scroll = _scroll+5;
	}else{
		[g_ResManager stopMusic];
	}
	++gScore;
	_bg1.x = -((_scroll+BACKGROUNDWIDTH)%(BACKGROUNDWIDTH*2)-BACKGROUNDWIDTH);
	_bg2.x = -((_scroll+BACKGROUNDWIDTH*2)%(BACKGROUNDWIDTH*2)-BACKGROUNDWIDTH);
}

- (void)draw{
	[super draw];
	[_bg1 draw];
	[_bg2 draw];
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

- (void)dealloc{
	[_stage release];
	[_bg1 release];
	[_bg2 release];
	[super dealloc];
}

@end

