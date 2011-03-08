//
//  Sprite.h
//  Meteos
//
//  Created by giginet on 11/03/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ResourceManager.h"
#import "GLTexture.h"
#include "Vector.h"

@interface Sprite : NSObject {
@protected
	CGFloat _x, _y;
	CGFloat _alpha, _xscale, _yscale, _angle;
	CGRect _dest, _area, _hit;
@private
	NSString* textureName;
}

- (id)initWithTexture:(NSString*)texture;

- (void)update;
- (void)draw;

- (CGRect)hitArea;
- (CGPoint)hitAreaCenter;

- (BOOL)collideWithPoint:(CGPoint)point;
- (BOOL)collideWithSprite:(Sprite*)sprite;
- (BOOL)collideWithCircle:(CGPoint)center:(float)radius;

- (float)distance:(Sprite*)sprite;

- (CGPoint)center;
- (CGPoint)point;

//- (float)bound:(NSString*)point;

@property(readwrite) CGFloat alpha, xscale, yscale, angle;
@property(readwrite) CGRect area, dest;
@property(readwrite) CGFloat x,y;

@end
