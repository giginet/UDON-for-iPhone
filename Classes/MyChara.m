//
//  MyChara.m
//  UDON
//
//  Created by giginet on 11/03/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyChara.h"


@implementation MyChara
@synthesize mogCount=_mogCount;

- (id)init{
	[super initWithTextureAndSize:@"mychara.png" :CGSizeMake(MYCHARAWIDTH, MYCHARAHEIGHT)];
	
	_mogMax = MYCHARAMOGMAX;
	_mogCount = _mogMax;
	_x = MYCHARAINITIALX;
	_y = MYCHARAINITIALY;
	_speed = MYCHARAINITIALSPEED;
	_goal = [[Vector alloc] initWithPoint:CGPointMake(MYCHARAINITIALX, MYCHARAINITIALY)];
	self.index = 0;
	return self;
}

- (void)update{
	Vector* currentPosition = [[[Vector alloc] initWithPoint:[self center]] autorelease];
	_v = [[_goal clone] sub:currentPosition];
	_v.x = 0;
	[_v max:_speed];
	[super update];
}

- (BOOL)mogmog:(Prefecture*)target{
	if(_mogCount > 0){
		--_mogCount;
		//あとでかく
		return YES;
	}
	return NO;
}

- (void)setGoal:(CGPoint)point{
	[_goal set:point];
	float tmpx = _goal.x;
	_goal.x = _goal.y;
	_goal.y = 320 - tmpx;
}

@end
