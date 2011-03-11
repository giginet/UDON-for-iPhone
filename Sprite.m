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
	_area = CGRectMake(0, 0, image.width, image.height);
	_hit = CGRectMake(0, 0, image.width, image.height);
	_direction = 0;
	return self;
}

- (void)update{
}

- (void)draw{
	float a = _angle;
	float cx = _x;
	float cy = _y;
	//スクリーンの向きが違っていた場合は補正
	if(_direction == 1){
		CGPoint p = [Coordinate fromLeftBottom:CGPointMake(_x, _y)];
		//座標変換する
		CGPoint newCenter = CGPointMake(p.x+_dest.size.width/2, p.y+_dest.size.height/2);
		CGPoint trueCenter = CGPointMake(p.x-_dest.size.height/2, p.y+_dest.size.width/2);
		cx = p.x + trueCenter.x - newCenter.x;
		cy = p.y + trueCenter.y - newCenter.y;
		a += _angle+270;
	}else if(_direction == 2){
		CGPoint p = [Coordinate toRightBottom:CGPointMake(_x, _y)];
		cx = p.x;
		cy = p.y;
		a += _angle+90;
	}
	
	//座標を左上0,0に補正する。
	_dest.origin.x = cx;
	_dest.origin.y = cy;
	CGRect screen = [[UIScreen mainScreen] applicationFrame];
	CGRect dest = CGRectMake(_dest.origin.x, 
							 screen.size.height - _dest.origin.y - _area.size.height,
							 _area.size.width, _area.size.height);
	[[g_ResManager getTexture:textureName] drawInRect:dest
											 withClip:_area 
										 withRotation:a];
}

- (CGRect)hitArea{
	return CGRectMake(_x+_hit.origin.x, _y+_hit.origin.y, _hit.size.width, _hit.size.height);
}

- (CGPoint)hitAreaCenter{
	return CGPointMake(_x+_hit.origin.x+_hit.size.width/2, _y+_hit.origin.y+_hit.size.height/2);
}

- (BOOL)collideWithPoint:(CGPoint)point{
	CGRect hit = [self hitArea];
	return hit.origin.x <= point.x && point.x <= hit.origin.x+hit.size.width && 
	hit.origin.y <= point.y && point.y <= hit.origin.y+hit.size.height;
}

- (BOOL)collideWithSprite:(Sprite*)sprite{
	CGRect recta = [self hitArea];
	CGRect rectb = [sprite hitArea];
	CGPoint centera = [self hitAreaCenter];
	CGPoint centerb = [sprite hitAreaCenter];
	return (abs(centera.x - centerb.x) < (recta.size.width + rectb.size.width)/2) &&
	(abs(centera.y - centerb.y) < (recta.size.height + rectb.size.height)/2);
}

//あとでかく
- (BOOL)collideWithCircle:(CGPoint)center:(float)radius{
	return NO;
}

- (float)distance:(Sprite*)sprite{
	float distance = [[[[[Vector alloc] initWithPoint:self.hitAreaCenter] autorelease] 
	  sub:[[[Vector alloc] initWithPoint:sprite.hitAreaCenter] autorelease]] length];
	return distance;
}

- (CGPoint)center{
	return CGPointMake(_x+_dest.size.width/2, _y+_dest.size.height/2);
}

- (CGPoint)point{
	return CGPointMake(_x, _y);
}

- (void)changeDirection:(NSString*)direction{
	if([direction isEqualToString:@"bottom"]){
		_direction = 0;
	}else if([direction isEqualToString:@"left"]){
		_direction = 1;
	}else if([direction isEqualToString:@"right"]){
		_direction = 2;
	}
}


@end
