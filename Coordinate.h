//
//  Coordinate.h
//  UDON
//
//  Created by giginet on 11/03/09.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Coordinate : NSObject {
}
+(CGPoint)toLeftBottom:(CGPoint)point;
+(CGPoint)toRightBottom:(CGPoint)point;

+(CGPoint)toLeftBottomWithSprite:(CGPoint)sprite;
+(CGPoint)toRightBottomWithSprite:(CGPoint)sprite;



@end
