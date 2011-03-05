//
//  Singleton.h
//  Meteos
//
//  Created by giginet on 11/03/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
// ref: http://journal.mycom.co.jp/column/objc/050/index.html
// Usage: 
//		SubSingleton* instance = [SubSingleton instance];

#import <Foundation/Foundation.h>


@interface Singleton : NSObject {
}
+ (id)instance;

@end
