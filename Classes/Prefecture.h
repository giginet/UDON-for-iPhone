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
}
- (id)initWithNumber:(NSInteger)n;

@end
