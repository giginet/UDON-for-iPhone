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
	int _mogCount;
	float _speed;
	int _hp;
	Vector* _goal;
}

- (BOOL)mogmog:(Prefecture*)target;
- (void)setGoal:(CGPoint)point;
- (BOOL)damage:(Prefecture*)attacker;

@property(readwrite) int mogCount;
@end
