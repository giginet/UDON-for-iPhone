//
//  GameStateManager.m
//  GameFramework
//
//  Created by giginet on 10/12/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GameStateManager.h"


@implementation GameStateManager
- (void)doStateChange:(Class)state{
}

+ (BOOL)isPad{
#ifdef UI_USER_INTERFACE_IDIOM
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
#else
    return NO;
#endif
}
@end
