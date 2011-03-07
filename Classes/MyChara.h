//
//  MyChara.h
//  UDON
//
//  Created by giginet on 11/03/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"
#import "Timer.h"
#import "Settings.h"
#import "Prefecture.h"

@interface MyChara : Character {
	Timer* _invincibleTimer;
	int _mogMax, _mogCount;
	float _speed;
	Vector* _goal;
}

- (BOOL)mogmog:(Prefecture*)target;
- (void)setGoal:(CGPoint)point;

@property(readwrite) int mogCount;
@end
