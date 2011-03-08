//
//  UDONAppDelegate.m
//  UDON
//
//  Created by giginet on 11/03/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UDONAppDelegate.h"
#import "UDONViewController.h"

@implementation UDONAppDelegate

@synthesize window;
@synthesize viewController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	[ResourceManager initialize];
	[NSTimer scheduledTimerWithTimeInterval:0.033
									 target:self
								   selector:@selector(gameLoop:)
								   userInfo:nil
									repeats:NO];
	//リファレンス確認
	//Framerateをハードコーディングして大丈夫か？
	[self doStateChange: [TitleScene class]];
}

- (void) gameLoop:(id) sender {
	//Framerateの計算
	double currTime = [ [NSDate date] timeIntervalSince1970];
	m_FPS_framesThisSecond++;
	float timeThisSecond = currTime - m_FPS_lastSecondStart;
	if(timeThisSecond > 1.0f){
		m_FPS = m_FPS_framesThisSecond;
		m_FPS_framesThisSecond = 0;
		m_FPS_lastSecondStart = currTime;
	}
	[((GameState*)viewController.view) update];
	[((GameState*)viewController.view) draw];
	[NSTimer scheduledTimerWithTimeInterval:0.033
									 target:self
								   selector:@selector(gameLoop:)
								   userInfo:nil
									repeats:NO];
}

- (void) doStateChange: (Class) state {
	if( viewController.view != nil){
		//ウィンドウから既存の画面を削除
		[viewController.view removeFromSuperview];
		[viewController.view release];
	}
	
	viewController.view = [[state alloc]
						   initWithFrame:CGRectMake(0,0,320.0,480.0)
						   andManager:self];
	
	[window addSubview:viewController.view];
	[window makeKeyAndVisible];
}

/*
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

    // Add the view controller's view to the window and display.
    [self.window addSubview:viewController.view];
    [self.window makeKeyAndVisible];

    return YES;
}*/


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
