//
//  GameStateManager.h
//  GameFramework
//
//  Created by giginet on 10/12/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface GameStateManager : NSObject {
}
- (void) doStateChange: (Class) state;
+ (BOOL)isPad;

@end
