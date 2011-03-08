//
//  Coordinate.m
//  UDON
//
//  Created by giginet on 11/03/09.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Coordinate.h"


@implementation Coordinate

+ (CGPoint)toLeftBottom:(CGPoint)point{
	int width = [[UIScreen mainScreen] applicationFrame].size.width;
	CGPoint conv = CGPointMake(point.y, width - point.x);
	return conv;
}

+ (CGPoint)toRightBottom:(CGPoint)point{
	return point;
}

@end
