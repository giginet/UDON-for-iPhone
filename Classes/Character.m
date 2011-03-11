//
//  Character.m
//  UDON
//
//  Created by giginet on 11/03/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Character.h"


@implementation Character

- (id)initWithTexture:(NSString *)texture andSize:(CGSize)size{
	_v = [[Vector alloc] init];
	[super initWithTexture:texture andSize:size];
	[self changeDirection:@"left"];
	return self;
}

- (void)update{
	_x += _v.x;
	_y += _v.y;
	[super update];
}

- (void)dealloc{
	[_v release];
	[super dealloc];
}

@end
