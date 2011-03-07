//
//  Vector.m
//  Kawaz
//
//  Created by giginet on 10/12/08.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Vector.h"


@implementation Vector

@synthesize x=_x, y=_y;

- (id)init{
	[super init];
	_x = 0;
	_y = 0;
	return self;
}

- (id)initWithPoint:(CGPoint)point{
	_x = point.x;
	_y = point.y;
	return self;
}

- (Vector*)set:(CGPoint)point{
	_x = point.x;
	_y = point.y;
	return self;
}

- (Vector*)clone{
	return [[Vector alloc] initWithPoint:CGPointMake(_x, _y)];
}

- (Vector*)add:(Vector *)v{
	_x += v.x;
	_y += v.y;
	return self;
}

- (Vector*)sub:(Vector *)v{
	_x -= v.x;
	_y -= v.y;
	return self;
}

- (CGFloat)scalar:(Vector *)v{
	return _x*v.x+_y*v.y;
}

- (CGFloat)cross:(Vector *)v{
	return _x*v.y-_y*v.x;
}

- (Vector*)scale:(CGFloat)n{
	_x *= n;
	_y *= n;
	return self;
}

- (CGFloat)length{
	return sqrt(_x*_x+_y*_y);
}

- (Vector*)normalize{
	if([self length]==0){
		_x = 0;
		_y = 0;
		return self;
	}else{
		return [self scale:1/[self length]];
	}
}

- (Vector*)resize:(CGFloat)n{
	return [[self normalize] scale:n];
}

- (CGFloat)angle{
	return atan2(_y, _x);
}

- (Vector*)rotate:(CGFloat)deg{
	CGFloat rad = M_PI*deg/180;
	CGFloat tmpx = _x;
	_x = sin(rad)*_y+cos(rad)*_x;
	_y = cos(rad)*_y-sin(rad)*tmpx;
	return self;
}

- (Vector*)reverse{
	_x *=-1;
	_y *=-1;
	return self;
}

- (Vector*)max:(CGFloat)max{
	if([self length] > max){
		[self resize:max]; 
	}
	return self;
}

- (Vector*)min:(CGFloat)min{
	if([self length] < min){
		[self resize:min]; 
	}
	return self;
}
@end
