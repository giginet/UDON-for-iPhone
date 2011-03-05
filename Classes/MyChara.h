//
//  MyChara.h
//  UDON
//
//  Created by giginet on 11/03/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animation.h"
#import "Timer.h"

@interface MyChara : Animation {
	Vector* _v;
	Timer* _invincibleTimer;
	int _mogMax, _mogCount;
	float _speed;
	CGPoint _goal;
}

- (int)mogmog;

@property(readwrite) CGPoint goal;

@end
