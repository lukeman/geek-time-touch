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
- (void)updateClock:(NSTimer *)aTimer;
- (void)webViewDidFinishLoad:(UIWebView *)webView;

@end

