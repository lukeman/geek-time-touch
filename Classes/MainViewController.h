//
//  MainViewController.h
//  GeekTimeTouch
//


#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
    IBOutlet UILabel *titleLabel;
	IBOutlet UIWebView *geekTimeDisplay;
    
	NSString *clockDisplay;
    NSCalendar *calendar;
    NSTimeZone *UTC;
}


- (IBAction)showInfo:(id)sender;
- (void)updateClock:(NSTimer *)aTimer;

@end

