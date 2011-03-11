//
//  GameState.h
//  GameFramework
//
//  Created by giginet on 10/12/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameStateManager.h"
#import "ResourceManager.h"
#import <UIKit/UIView.h>
#import "Sprite.h"


@interface GameState : UIView {
	GameStateManager* _manager;
	NSMutableArray* _sprites;
}
- (id) initWithFrame:(CGRect)frame andManager:(GameStateManager*)pManager;
- (void) draw;
- (void) update;

- (void) ready;
- (void) clean;

//@property NSMutableArray* sprites;

@end
