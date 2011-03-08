//
//  Animation.h
//  Meteos
//
//  Created by giginet on 11/03/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "Sprite.h"
#import "Timer.h"

@interface Animation : Sprite {
@private
	int _currentFrame, _index, _maxFrame;
	CGSize _size;
	Timer* _animationTimer;
	BOOL _flagEnable, _flagReverse, _flagLoop;
}

- (id)initWithTexture:(NSString*)texture andSize:(CGSize)size;

- (void)setAnimationPerFrame:(int)apf;

- (id)play;
- (id)pause;
- (id)reset;

- (BOOL)isOver;

@property(getter=isReverse, setter=enableReverse) BOOL reverse;
@property(getter=isLooping, setter=enableLooping) BOOL looping;
@property(readonly) BOOL isActive;
@property(readonly) int maxFrame, currentFrame;
@property(readwrite) int index;

@end
