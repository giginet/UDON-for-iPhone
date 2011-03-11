//
//  Number.h
//  UDON
//
//  Created by giginet on 11/03/10.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animation.h"

@interface Number : NSObject {
@private
	float _x, _y;
	float _angle;
	int _number;
	int _preNumber;
	int _align;
	int _place;
	int _width;
	int _height;
	NSString* _direction;
	int _offset;
	NSString* _textureName;
	Sprite** _numbers;
}

- (id)initWithNumber:(int)n andTexture:(NSString*)texture;
- (void)setAlignRight;
- (void)setAlignLeft;


- (void)perse:(int)number;
- (void)draw;
- (void)changeDirection:(NSString*)direction;

@property(readwrite) int offset, number;
@property(readwrite) float x, y, angle;

@end
