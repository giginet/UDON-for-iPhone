//
//  Prefecture.h
//  UDON
//
//  Created by giginet on 11/03/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"
#import "Vector.h"
#import "Settings.h"

@interface Prefecture : Character {
	int _number;
	CGRect _mogArea;
}
- (id)initWithNumber:(NSInteger)n;
- (CGRect)calcHitArea:(NSInteger)n;

- (CGRect)mogArea;

@end
