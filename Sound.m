//
//  Sound.m
//  UDON
//
//  Created by giginet on 11/03/09.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Sound.h"


@implementation Sound

-(id) initWithSound:(NSString*)filename{
	_filename = [[NSString alloc] initWithString:filename];
	return self;
}

-(void)play{
	[g_ResManager playSound:_filename];
}

@end
