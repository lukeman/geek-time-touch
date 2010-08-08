//
//  GeekTimeTouchAppDelegate.h
//  GeekTimeTouch
//


#import <UIKit/UIKit.h>

@class MainViewController;

@interface GeekTimeTouchAppDelegate : NSObject <UIApplicationDelegate> {

    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;


@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end

