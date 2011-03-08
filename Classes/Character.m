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
	return [super initWithTexture:texture andSize:size];
}

- (void)update{
	_x += _v.x;
	_y += _v.y;
}

- (void)draw{
	//座標変換する
	int width = [[UIScreen mainScreen] applicationFrame].size.width;
	CGFloat tmpx = _x, tmpy = _y, tmpa = _angle;
	_x = width - _y - _dest.size.width;
	_y = tmpx;
	_angle = tmpa + 270;
	[super draw];
	_x = tmpx;
	_y = tmpy;
	_angle = tmpa;
}

@end
