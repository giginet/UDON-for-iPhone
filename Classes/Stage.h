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

@interface Stage : NSObject {
	MyChara* _manbe;
	NSMutableArray* _enemies;
}
- (void)popEnemy;
- (void)killEnemy:(Prefecture*)enemy;
- (void)mogEnemy:(Prefecture*)enemy;
- (Prefecture*)mogCheck:(CGPoint)point;

@property(readonly) MyChara* mychara;
@end
