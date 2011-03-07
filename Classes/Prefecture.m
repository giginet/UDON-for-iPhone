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
	[super initWithTextureAndSize:@"prefectures.png" 
								 :CGSizeMake(PREFECTUREWIDTH, PREFECTUREHEIGHT)];
	//[self stop];
	int f = _number%7;
	self.index = _number/7;
	_v.x = 5+rand()%5;
	_x = 500;
	int h = [[UIScreen mainScreen] applicationFrame].size.height;
	_y = rand()%h-PREFECTUREHEIGHT;
	[_v reverse];
	return self;
}

@end
