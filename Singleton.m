//
//  Singleton.m
//  Meteos
//
//  Created by ぎぎ on 11/03/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Singleton.h"


@implementation Singleton

static id _instance = nil;
static BOOL _willDelete = NO;

+ (id)instance{
	@synchronized(self){
		if(!_instance){
			[[self alloc] init];
		}
	}
	return _instance;
}

+ (id)allocWithZone:(NSZone*)zone{
	@synchronized(self){
		if(!_instance){
			_instance = [super allocWithZone:zone];
			return _instance;
		}
	}
	return nil;
}

+ (void)deleteInstance{
	if(_instance){
		@synchronized(_instance){
			_willDelete = YES;
			[_instance release];
			_instance = nil;
			_willDelete = NO;
		}
	}
}

- (void) release{
	@synchronized(self){
		if(_willDelete){
			[super release];
		}
	}
}

- (id)copyWithZone:(NSZone*)zone{ return self; }
- (id)retain{ return self; }
- (unsigned)retainCount{ return UINT_MAX; }
- (id)autorelease{ return self; }

@end
