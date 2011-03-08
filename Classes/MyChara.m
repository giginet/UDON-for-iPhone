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
	[super initWithTexture:@"mychara.png" andSize:CGSizeMake(MYCHARAWIDTH, MYCHARAHEIGHT)];
	_hp = MYCHARAINITIALHP;
	_mogCount = MYCHARAMOGMAX;
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
		_speed = MYCHARAINITIALSPEED * pow(0.8, (MYCHARAMOGMAX-_mogCount));
		return YES;
	}
	return NO;
}

- (void)setGoal:(CGPoint)point{
	[_goal set:point];
}

- (BOOL)damage:(Prefecture*)attacker{
	--_hp;
	if(_hp > 0){
		//無敵処理とか
		return NO;
	}
	return YES;
}

@end
