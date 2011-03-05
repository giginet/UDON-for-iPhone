//
//  UDONAppDelegate.h
//  UDON
//
//  Created by giginet on 11/03/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "MainScene.h"
#include "GameStateManager.h"
#include "ResourceManager.h"

@class UDONViewController;

@interface UDONAppDelegate : GameStateManager <UIApplicationDelegate> {
    UIWindow *window;
    UDONViewController *viewController;
	
	CFTimeInterval m_FPS_lastSecondStart;
	int m_FPS_framesThisSecond;
	int m_FPS;
}
- (int) getFramesPerSecond;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UDONViewController *viewController;

@end
