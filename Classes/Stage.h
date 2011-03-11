//
//  Stage.h
//  UDON
//
//  Created by giginet on 11/03/06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyChara.h"
#import "Prefecture.h"
#import "Settings.h"
#import "Vector.h"
#import "Timer.h"

@interface Stage : NSObject {
	MyChara* _manbe;
	NSMutableArray* _enemies;
	Timer* _overTimer;
	int _popRate;
	int _popCounter;
}
- (void)update;
- (void)draw;

- (void)popEnemy;
- (void)killEnemy:(Prefecture*)enemy;
- (BOOL)mogEnemy:(Prefecture*)enemy;
- (BOOL)mogCheck:(CGPoint)point;

- (BOOL)isOver;

@property(readonly) MyChara* mychara;
@end
