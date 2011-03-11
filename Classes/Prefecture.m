//
//  Prefecture.m
//  UDON
//
//  Created by giginet on 11/03/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Prefecture.h"


@implementation Prefecture

- (id)initWithNumber:(NSInteger)n{
	_number = n;
	[super initWithTexture:@"prefectures.png" 
				   andSize:CGSizeMake(PREFECTUREWIDTH, PREFECTUREHEIGHT)];
	[self pause];
	self.currentFrame = _number%7;
	self.index = _number/7;
	_v.x = 5+rand()%5;
	_x = 500;
	int w = [[UIScreen mainScreen] applicationFrame].size.width;
	_y = rand()%w-30;
	_hit = [self calcHitArea:n];
	_mogArea = CGRectMake(0, 0, PREFECTUREWIDTH, PREFECTUREHEIGHT);
	[_v reverse];
	return self;
}

- (CGRect)calcHitArea:(NSInteger)n{
	int size[47][2] = {{150,160},
	 {55, 44}, 
	 {48, 72},
	 {42, 66},
	 {44, 50},
	 {36, 46},
	 {38, 44},
	 {34, 18},
	 {48, 38},
	 {78, 74},
	 {56, 50},
	 {44, 44},
	 {32, 44},
	 {46, 26},
	 {32, 42},
	 {46, 36},
	 {42, 40},
	 {42, 38},
	 {28, 26},
	 {25, 38},
	 {24, 30},
	 {48, 42},
	 {42, 66},
	 {32, 34},
	 {32, 18},
	 {40, 32},
	 {40, 68},
	 {54, 62},
	 {54, 50},
	 {38, 48},
	 {36, 58},
	 {60, 54},
	 {32, 34},
	 {42, 24},
	 {60, 58},
	 {40, 50},
	 {43, 44},
	 {34, 32},
	 {50, 54},
	 {40, 50},
	 {38, 44},
	 {40, 36},
	 {50, 74},
	 {24, 37},
	 {32, 32},
	 {32, 24},
	 {44, 44}};
	int w = size[n][0]/2;
	int h = size[n][1]/2;
	return CGRectMake((PREFECTUREWIDTH-w)/2, (PREFECTUREHEIGHT-h)/2, w, h);
}

- (CGRect)mogArea{
	return CGRectMake(_mogArea.origin.x + _x, _mogArea.origin.y + _y , _mogArea.size.width, _mogArea.size.height);
}


@end
