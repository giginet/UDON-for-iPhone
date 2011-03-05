//
//  GameState.h
//  GameFramework
//
//  Created by giginet on 10/12/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameStateManager.h"
#import <UIKit/UIView.h>


@interface GameState : UIView {
	GameStateManager* m_pManager;	
}
- (id) initWithFrame:(CGRect)frame andManager:(GameStateManager*)pManager;
- (void) draw;
- (void) update;

@end
