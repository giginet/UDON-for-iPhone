//
//  GameState.m
//  GameFramework
//
//  Created by giginet on 10/12/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GameState.h"

@implementation GameState
- (id) initWithFrame: (CGRect)frame andManager: (GameStateManager*)pManager{
	if(self = [super initWithFrame:frame]){
		m_pManager = pManager;
		self.userInteractionEnabled = true;//ユーザー操作を受け付ける
	}
	return self;
}

- (void) update{
}

- (void) draw{
}

- (void)drawRect:(CGRect)rect{
}

@end
