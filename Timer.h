//
//  Timer.h
//  Meteos
//
//  Created by giginet on 11/03/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

//時間を管理するクラス

@interface Timer : NSObject {
@private
	int _time, _max;
	BOOL _flagLoop, _flagActive;
}

- (id)init;
- (id)initWithMax:(int)max;

- (void)tick;

- (id)play;
- (id)stop;
- (id)pause;

- (id)reset;

- (void)count;
- (id)move:(int)n;

- (BOOL)isOver;

@property(readonly) BOOL isActive;
@property(getter=isLooping, setter=enableLooping) BOOL looping;
@property(readonly) int now;
@property(setter=set) int max;
@end
