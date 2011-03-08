//
//  GameState.m
//  GameFramework
//
//  Created by giginet on 10/12/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GameState.h"

@implementation GameState
@synthesize sprites=_sprites;

- (id) initWithFrame: (CGRect)frame andManager: (GameStateManager*)pManager{
	if(self = [super initWithFrame:frame]){
		_manager = pManager;
		_sprites = [[NSMutableArray alloc] initWithCapacity:0];
		self.userInteractionEnabled = true;//ユーザー操作を受け付ける
		[self ready];
	}
	return self;
}

- (void) update{
	for(Sprite* sprite in _sprites){
		[sprite update];
	}
}

- (void) draw{
	for(Sprite* sprite in _sprites){
		[sprite update];
	}	
}

- (void) ready{
}

- (void) finalize{
	[super finalize];
	[_sprites removeAllObjects];
}

- (void)drawRect:(CGRect)rect{
}

@end
