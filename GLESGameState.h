//
//  GLESGameState.h
//  Test_Framework
//
//  Created by Joe Hogue on 4/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameState.h"
#define MAGNIFICATION_FACTOR_IPAD (0.5)
#define MAGNIFICATION_FACTOR_IPHONE (1)

@interface GLESGameState : GameState {

}

- (void) startDraw;
- (void) swapBuffers;
- (BOOL) bindLayer;
+ (void) setup2D;

-(id) initWithFrame:(CGRect)frame andManager:(GameStateManager*)pManager;

@end
