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
	return self;
}

- (void)update{
	int r = rand()%100;
	if(!r){
		[self popEnemy];
	}
	[_manbe update];
	NSMutableArray* killList = [[[NSMutableArray alloc] init] autorelease];
	for(Prefecture* enemy in _enemies){
		[enemy update];
		if(enemy.x < - PREFECTUREWIDTH){
			[killList addObject:enemy];
		}else if([_manbe collideWithSprite:enemy]){
			[_manbe damage:enemy];
			[killList addObject:enemy];
		}
	}
	for (Prefecture* enemy in killList){
		[self killEnemy:enemy];
	}
}

- (void)draw{
	[_manbe draw];
	for(Prefecture* enemy in _enemies){
		[enemy draw];
	}
}

- (void)popEnemy{
	int n = rand()%PREFECTURECOUNT;
	Prefecture* enemy = [[Prefecture alloc] initWithNumber:n];
	[_enemies addObject:enemy];
	NSLog(@"Enemies:%d", [_enemies count]);
}

- (void)killEnemy:(Prefecture*)enemy{
	[_enemies removeObject:enemy];
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
		if([enemy collideWithPoint:point]){
			NSLog(@"hit");
			[self mogEnemy:enemy];
			return YES;
		}
	}
	return NO;
}

@end
