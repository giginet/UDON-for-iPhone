//
//  Animation.m
//  Meteos
//
//  Created by giginet on 11/03/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Animation.h"


@implementation Animation
@synthesize reverse=_flagReverse, looping=_flagLooping, isActive=_flagEnable;
@synthesize maxFrame=_maxFrame, currentFrame=_currentFrame, index=_index;

- (id)initWithTextureAndSize:(NSString *)texture :(CGSize)size{
	[super initWithTexture:texture];
	_size = size;
	_index = 0;
	_currentFrame = 0;
	_maxFrame = self.dest.size.width/size.width;
	_animationTimer = [[Timer alloc] initWithMax:1];
	_flagEnable = YES;
	_flagReverse = NO;
	_flagLoop = YES;
	self.dest = CGRectMake(self.x, self.y, size.width, size.height);
	self.area = CGRectMake(_currentFrame*size.width, _index*size.height, 
					   size.width, size.height);
	self.hit = self.area;
	[_animationTimer play];
	return self;
}

- (void)setAnimationPerFrame:(int)apf{
	[_animationTimer set:apf];
}

- (id)play{
	_flagEnable = YES;
	return self;
}

- (id)pause{
	_flagEnable = NO;
	return self;
}

- (id)reset{
	if(!_flagReverse){
		_currentFrame = 0;
	}else{
		_currentFrame = _maxFrame -1;
	}
	[_animationTimer reset];
	return self;
}

- (void)update{
	if(!_flagEnable) return;
	[_animationTimer tick];
	if([_animationTimer isOver]){
		if(!_flagReverse){
			++_currentFrame;
		}else{
			--_currentFrame;
		}
		if([self isOver]){
			if(_flagLoop){
				[self reset];
			}else{
				[self pause];
			}
		}
		[_animationTimer reset];
	}
	self.area = CGRectMake(_size.width*_currentFrame, _size.height*_index, 
					   _size.width, _size.height);
}

- (void)draw{
	[super draw];
}

- (BOOL)isOver{
	return (!_flagReverse &&_currentFrame >= _maxFrame) || (_flagReverse && _currentFrame <= 0);
}

@end
