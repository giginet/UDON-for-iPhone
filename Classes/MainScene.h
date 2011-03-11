//
//  MainScene.h
//  UDON
//
//  Created by giginet on 11/03/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GLESGameState.h"
#import "Stage.h"
#import "Sprite.h"
#import "Prefecture.h"
#import "Coordinate.h"
#import "ResultScene.h"
#import "ResourceManager.h"
#import "Sound.h"

extern int gScore;

@interface MainScene : GLESGameState {
@private
	Stage* _stage;
	Sprite* _bg1;
	Sprite* _bg2;
	int _score;
	int _scroll;
}

@end
