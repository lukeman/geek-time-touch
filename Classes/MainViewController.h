//
//  MainViewController.h
//  GeekTimeTouch
//


#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *geekTimeClock;
    
    NSCalendar *calendar;
    NSTimeZone *UTC;
}


- (IBAction)showInfo:(id)sender;

@end

