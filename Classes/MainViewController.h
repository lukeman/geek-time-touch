//
//  MainViewController.h
//  GeekTimeTouch
//


#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIWebViewDelegate> {
    IBOutlet UILabel *titleLabel;
	IBOutlet UIWebView *geekTimeDisplay;
    
	NSString *clockDisplay;
    NSCalendar *calendar;
    NSTimeZone *UTC;
}

- (IBAction)showInfo:(id)sender;
- (void)webViewDidFinishLoad:(UIWebView *)webView;
- (void)showClockDisplay:(UIWebView *)webView;
- (void)updateClock:(NSTimer *)aTimer;

@end

