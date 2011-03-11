//
//  BGNPlayer.h
//  UDON
//
//  Created by giginet on 11/03/09.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"


@interface BGNPlayer : Singleton {
	NSString* _introFile;
	NSString* _loopFile;
	int _loopCount;
	int _loopMax;
}

@end
