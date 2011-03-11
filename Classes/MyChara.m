//
//  MyChara.m
//  UDON
//
//  Created by giginet on 11/03/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyChara.h"


@implementation MyChara
@synthesize mogCount=_mogCount, hp=_hp;

- (id)init{
	[super initWithTexture:@"mychara.png" andSize:CGSizeMake(MYCHARAWIDTH, MYCHARAHEIGHT)];
	_hp = MYCHARAINITIALHP;
	_mogCount = MYCHARAMOGMAX;
	_invincibleTimer = [[Timer alloc] initWithMax:45];
	_x = MYCHARAINITIALX;
	_y = MYCHARAINITIALY;
	_speed = MYCHARAINITIALSPEED;
	_goal = [[Vector alloc] initWithPoint:CGPointMake(MYCHARAINITIALX, MYCHARAINITIALY)];
	_hit = CGRectMake(21, 3, 25, 45);
	self.index = 0;
	[self setAnimationPerFrame:5];
	return self;
}

- (void)update{
	[_invincibleTimer tick];
	if([_invincibleTimer isOver]){
		self.index = 0;
		[_invincibleTimer stop];
	}
	Vector* currentPosition = [[[Vector alloc] initWithPoint:[self center]] autorelease];
	_v = [[_goal clone] sub:currentPosition];
	_v.x = 0;
	[_v max:_speed];
	[super update];
}

- (BOOL)mogmog:(Prefecture*)target{
	if(_mogCount > 0){
		--_mogCount;
		[g_ResManager playSound:@"mog.caf"];
		_speed = MYCHARAINITIALSPEED * pow(MYCHARASPEEDDOWN, (MYCHARAMOGMAX-_mogCount));
		self.index = 3;
		[_invincibleTimer reset];
		[_invincibleTimer play];
		return YES;
	}
	return NO;
}

- (void)setGoal:(CGPoint)point{
	[_goal set:point];
	if(_hp > 0){
		if(point.y > _y){
			[g_ResManager playSound:@"down.caf"];
		}else if(point.y < _y){
			[g_ResManager playSound:@"up.caf"];
		}
	}
}

- (BOOL)damage:(Prefecture*)attacker{
	if(!
	   _invincibleTimer.isActive) --_hp;
	if(_hp > 0){
		//無敵処理とか
		self.index = 1;
		[_invincibleTimer reset];
		[_invincibleTimer play];
		
		return NO;
	}else{
		[g_ResManager playSound:@"damage.caf"];
	}
	return YES;
}

- (void)dealloc{
	[_invincibleTimer release];
	[_goal release];
	[super dealloc];
}

@end
