//
//  MainViewController.m
//  GeekTimeTouch
//


#import "MainViewController.h"

@implementation MainViewController

- (void)viewDidLoad {
	
    [titleLabel setText:@"Geek Time"];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:36]];
	
	// Load from clockdisplay.html for our clock display template
	NSString *path = [[NSBundle mainBundle] pathForResource:@"clockdisplay" ofType:@"html"];  
	clockDisplay = [[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil] retain];
    
    [NSTimer scheduledTimerWithTimeInterval:0.65 target:self selector:@selector(updateClock:) userInfo:nil repeats:YES];
	
    [super viewDidLoad];
}

- (void)updateClock:(NSTimer *)aTimer {
	
	calendar = [NSCalendar currentCalendar];
	[calendar setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
	
	NSDate *date = [NSDate date];
	NSDateComponents *timeComponents = [calendar components:( NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:date];
	
	double all = [date timeIntervalSince1970];
	double ms = 1000 * (all - (int)all);
	int seconds = 1000 * [timeComponents second];
	int minute_seconds = 60000 * [timeComponents minute];
	int hour_seconds = 3600000 * [timeComponents hour];
	int seconds_year = (604800 * ([timeComponents week] - 1)) + (86400 * ([timeComponents weekday] + 1));
	
	float gt = 65536 * ((hour_seconds + minute_seconds + seconds + ms) / (86400000.0));
	float gd = seconds_year / (86400.0);
	
	NSString *currentTime = [NSString stringWithFormat:@"0x%04X", (int)round(gt)];
	NSString *currentDate = [NSString stringWithFormat:@"0x%03X", (int)round(gd)];
	NSString *geekChar = [NSString stringWithFormat:@"&#x%x;", (int)round(gt)];
	
	NSString *contents = [NSString stringWithFormat:clockDisplay, 
						  [currentTime substringToIndex:4],
						  [currentTime substringFromIndex:4],
						  currentDate,
						  geekChar];
	
	[geekTimeDisplay loadHTMLString:contents baseURL:nil];
	[geekTimeDisplay setUserInteractionEnabled:NO];
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo:(id)sender {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
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

