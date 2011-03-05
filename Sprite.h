//
//  Sprite.h
//  Meteos
//
//  Created by giginet on 11/03/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ResourceManager.h"
#import "GLTexture.h"

@interface Sprite : NSObject {
@protected	
	CGFloat _x, _y;
	NSString* textureName;
	CGFloat _alpha, _xscale, _yscale, _angle;
	CGRect _hit;
	CGRect _dest, _area;
}

- (id)initWithTexture:(NSString*)texture;

- (void)update;
- (void)draw;

- (BOOL)collideWithPoint:(CGPoint)point;
- (BOOL)collideWithSprite:(Sprite*)sprite;
- (BOOL)collideWithCircle:(CGPoint)center:(float)radius;

- (CGPoint)center;

- (float)bound:(NSString*)point;

@property(readwrite) CGFloat alpha, xscale, yscale, angle;
@property(readwrite) CGRect hit, area, dest;
@property(readwrite) CGFloat x,y;

@end
