//
//  MainViewController.m
//  GeekTimeTouch
//


#import "MainViewController.h"

@implementation MainViewController

- (void)viewDidLoad {
    [titleLabel setText:@"Geek Time"];
    [titleLabel setFont:[UIFont systemFontOfSize:36]];
    
    [geekTimeClock setFont:[UIFont fontWithName:@"Courier" size:72]];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0/15 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
    
    [super viewDidLoad];
}

- (void)timerFireMethod:(NSTimer *)aTimer {
	NSDate *date = [NSDate date];
    
	calendar = [NSCalendar currentCalendar];
	[calendar setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    
	NSDateComponents *timeComponents = [calendar components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:date];
    
	double all = [[NSDate date] timeIntervalSince1970];
	double ms = 1000 * (all - (int)all);
	int seconds = 1000 * [timeComponents second];
	int minute_seconds = 60000 * [timeComponents minute];
	int hour_seconds = 3600000 * [timeComponents hour];
    
	float gt = 65536 * ((hour_seconds + minute_seconds + seconds + ms) / (86400000.0));
    
    [geekTimeClock setText:[NSString stringWithFormat:@"0x%X", (int)round(gt)]];
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo:(id)sender {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
	return YES;
}

- (void)dealloc {
    
    [super dealloc];
}

@end

