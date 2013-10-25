//
//  setup2ViewController.m
//  Trakus
//
//  Created by ADRIAN BEDARD on 10/8/13.
//  Copyright (c) 2013 Hi Dev Mobile. All rights reserved.
//

#import "setup2ViewController.h"

@interface setup2ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UIDatePicker *alertTime;

@end

@implementation setup2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) updateUI
{
		//NSString *string = [NSData ];
}

- (IBAction)continue:(UIButton *)sender
{
	NSDate *alertTime = self.alertTime.date;
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
	[dateFormat setDateFormat:@"HH:mm"];
	NSString *timeString = [dateFormat stringFromDate:alertTime];

		NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
		[data setObject:timeString forKey:@"alertTime"];
	
	[self performSegueWithIdentifier:@"toConfirm" sender:self];
}

@end
