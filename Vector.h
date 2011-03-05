//
//  Vector.h
//  Kawaz
//
//  Created by giginet on 10/12/08.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "math.h"
@interface Vector : NSObject {
	CGFloat _x,_y;
}
@property(assign, readwrite) CGFloat x;
@property(assign, readwrite) CGFloat y;
- (id)init;
- (id)initWithPoint:(CGPoint)point;

- (Vector*)set: (CGFloat)vx :(CGFloat)vy;
- (Vector*)clone;
- (Vector*)add:(Vector*)v;
- (Vector*)sub:(Vector*)v;
- (CGFloat)scalar:(Vector*)v;
- (CGFloat)cross:(Vector*)v;
- (Vector*)scale:(CGFloat)n;
- (CGFloat)length;
- (Vector*)normalize;
- (Vector*)resize:(CGFloat)n;
- (CGFloat)angle;
- (Vector*)rotate:(CGFloat)deg;
- (Vector*)reverse;
@end
