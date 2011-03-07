//
//  Sprite.m
//  Meteos
//
//  Created by giginet on 11/03/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Sprite.h"


@implementation Sprite
@synthesize alpha=_alpha, xscale=_xscale, yscale=_yscale, angle=_angle;
@synthesize area=_area, dest=_dest;
@synthesize x=_x, y=_y;

- (id)initWithTexture:(NSString*)texture{
	[super init];
	textureName = texture;
	GLTexture* image = [g_ResManager getTexture:texture];
	_dest = CGRectMake(_x, _y, image.width, image.height);
	_area = _dest;
	_hit = _dest;
	return self;
}

- (void)update{
}

- (void)draw{
	//座標を左上0,0に補正する。
	_dest.origin.x = _x;
	_dest.origin.y = _y;
	CGRect screen = [[UIScreen mainScreen] applicationFrame];
	CGRect dest = CGRectMake(_dest.origin.x, 
							 screen.size.height - _dest.origin.y - _area.size.height,
							 _area.size.width, _area.size.height);
	[[g_ResManager getTexture:textureName] drawInRect:dest
											 withClip:_area 
										 withRotation:_angle];
}

- (CGRect)hitArea{
	return CGRectMake(_x+_hit.origin.x, _y+_hit.origin.y, _hit.size.height, _hit.size.width);
}

- (BOOL)collideWithPoint:(CGPoint)point{
	CGRect hit = [self hitArea];
	return hit.origin.x <= point.x || point.x <= hit.origin.x+hit.size.width || 
	hit.origin.y <= point.y || point.y <= _y+hit.size.height;
}

//あとでかく
- (BOOL)collideWithSprite:(Sprite*)sprite{
	return NO;
}

//あとでかく
- (BOOL)collideWithCircle:(CGPoint)center:(float)radius{
	return NO;
}

- (CGPoint)center{
	return CGPointMake(_x+_dest.size.width/2, _y+_dest.size.height/2);
}

- (CGPoint)point{
	return CGPointMake(_x, _y);
}


@end
