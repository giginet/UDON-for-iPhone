//
//  Stage.m
//  UDON
//
//  Created by giginet on 11/03/06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Stage.h"


@implementation Stage
@synthesize mychara=_manbe;
- (id)init{
	_manbe = [[MyChara alloc] init];
	_enemies = [[NSMutableArray alloc] initWithCapacity:0];
	_overTimer = [[Timer alloc] initWithMax:30];
	_popRate = INITIALPOPRATE;
	_popCounter = INITIALPOPRATE;
	return self;
}

- (void)update{
	[self popEnemy];
	[_manbe update];
	NSMutableArray* killList = [[[NSMutableArray alloc] init] autorelease];
	for(Prefecture* enemy in _enemies){
		[enemy update];
		if(enemy.x < - PREFECTUREWIDTH){
			[killList addObject:enemy];
		}else if([_manbe collideWithSprite:enemy] && !_overTimer.isActive){
			[_manbe damage:enemy];
			[killList addObject:enemy];
		}
	}
	for (Prefecture* enemy in killList){
		[self killEnemy:enemy];
	}
	if(_manbe.hp <= 0) [_overTimer play];
	[_overTimer tick];
}

- (void)draw{
	if(!_overTimer.isActive) [_manbe draw];
	for(Prefecture* enemy in _enemies){
		[enemy draw];
	}
}

- (void)popEnemy{
	int r;
	--_popCounter;
	if(!_popCounter){
		r= 0;
	}else{
		r = rand()%_popCounter;
	}
	if(!r){
		if([_enemies count] < MAXENEMY){
			int n = rand()%PREFECTURECOUNT;
			Prefecture* enemy = [[Prefecture alloc] initWithNumber:n];
			[_enemies addObject:enemy];
		}
		if(_popRate > MINPOPRATE) _popRate *= 0.98;
		_popCounter = _popRate;
	}
}

- (void)killEnemy:(Prefecture*)enemy{
	[_enemies removeObject:enemy];
	[enemy release];
}

- (BOOL)mogEnemy:(Prefecture*)enemy{
	float distance = [_manbe distance:enemy];
	if(distance < MOGAREARADIUS){
		if([_manbe mogmog:enemy]){
			[self killEnemy:enemy];
			return YES;
		}
	}
	return NO;
}

- (BOOL)mogCheck:(CGPoint)point{
	for(Prefecture* enemy in _enemies){
		if(CGRectContainsPoint([enemy mogArea], point)){
			[self mogEnemy:enemy];
			return YES;
		}
	}
	return NO;
}

- (BOOL)isOver{
	return [_overTimer isOver];
}

- (void)dealloc{
	[_enemies release];
	[_manbe release];
	[_overTimer release];
	[super dealloc];
}

@end
