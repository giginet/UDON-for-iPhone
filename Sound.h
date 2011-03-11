//
//  Sound.h
//  UDON
//
//  Created by giginet on 11/03/09.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResourceManager.h"

@interface Sound : NSObject {
	NSString* _filename;

}
-(id) initWithSound:(NSString*)filename;
-(void) play;

@end
