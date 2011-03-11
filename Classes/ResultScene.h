//
//  ResultScene.h
//  UDON
//
//  Created by giginet on 11/03/09.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLESGameState.h"
#import "Sprite.h"
#import "MainScene.h"
#import "Coordinate.h"
#import "Number.h"

@interface ResultScene : GLESGameState {
	Sprite* _resultImage;
	Number* _score;
}

@end

