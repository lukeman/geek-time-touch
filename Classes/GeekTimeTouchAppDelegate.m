//
//  GeekTimeTouchAppDelegate.m
//  GeekTimeTouch
//


#import "GeekTimeTouchAppDelegate.h"

#import "MainViewController.h"

@implementation GeekTimeTouchAppDelegate


@synthesize window;

@synthesize mainViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [window addSubview:mainViewController.view];
    [window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {

    // Save data if appropriate.
}

- (void)dealloc {

    [window release];
    [mainViewController release];
    [super dealloc];
}

@end

