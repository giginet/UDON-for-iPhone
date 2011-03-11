//
//  Number.m
//  UDON
//
//  Created by giginet on 11/03/10.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Number.h"


@implementation Number
@synthesize angle=_angle, x=_x, y=_y, number=_number, offset=_offset;

- (id)initWithNumber:(int)n andTexture:(NSString *)texture{
	[super init];
	_x = 0;
	_y = 0;
	_angle = 0;
	_direction = @"bottom";
	_offset = 0;
	_number = n;
	_preNumber = n;
	_textureName = texture;
	_numbers = (Sprite**) malloc(8*sizeof(Sprite**));
	GLTexture* image = [g_ResManager getTexture:_textureName];
	_width = image.width/10;
	_height = image.height;
	
	[self perse:n];
	return self;
}

- (void)perse:(int)number{
	NSString* ns = [[NSNumber numberWithUnsignedInt:number] stringValue];
	_place = [ns length];
	for(int i=0;i<_place;++i){
		int n = [[ns substringWithRange:NSMakeRange(i, 1)] intValue];
		_numbers[i] = [[Sprite alloc] initWithTexture:_textureName];
		_numbers[i].dest = CGRectMake(0,0,_width,_height);
		_numbers[i].area = CGRectMake(_width*n,0,_width,_height);
		_numbers[i].x = _x+_width*i+_offset*i;
		_numbers[i].y = _y;
		_numbers[i].angle = _angle;
		[_numbers[i] changeDirection:_direction];
	}
}

- (void)draw{
	if(_number != _preNumber){
		_preNumber = _number;
		[self perse:_number];
	}
	for(int i=0;i<_place;++i){
		_numbers[i].x = _x+_width*i+_offset*i;
		_numbers[i].y = _y;
		_numbers[i].angle = _angle;
		[_numbers[i] draw];
	}
}

- (void)changeDirection:(NSString*)direction{
	_direction = direction;
	for(int i=0;i<_place;++i){
		[_numbers[i] changeDirection:direction];
	}
}


@end
