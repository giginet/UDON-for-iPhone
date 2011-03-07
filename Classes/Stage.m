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

- (void)mogEnemy:(Prefecture*)enemy{
	float distance = [[[[[Vector alloc] initWithPoint:enemy.point] autorelease] 
					  sub:[[[Vector alloc] initWithPoint:_manbe.point] autorelease]] length];
	if(distance < MOGAREARADIUS){
		if([_manbe mogmog:enemy]){
			[self killEnemy:enemy];
		}
	}
}

- (Prefecture*)mogCheck:(CGPoint)point{
	for(Prefecture* enemy in _enemies){
		if([enemy collideWithPoint:point]){
			[self mogEnemy:enemy];
			return enemy;
		}
	}
	return 0;
}

@end
