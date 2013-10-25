//
//  confirmViewController.m
//  Trakus
//
//  Created by ADRIAN BEDARD on 10/12/13.
//  Copyright (c) 2013 Hi Dev Mobile. All rights reserved.
//

#import "confirmViewController.h"
#import "LaunchViewController.h"

@interface confirmViewController ()
@property (strong, nonatomic) IBOutlet UILabel *confirmText;
@property (strong, nonatomic) NSString *behavior;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) IBOutlet UILabel *timeText;
@property (strong, nonatomic) NSString *displayedText;
@end

@implementation confirmViewController

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
	
	NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	self.behavior = [@"You are tracking: " stringByAppendingString:[data objectForKey:@"behavior"]];
	
		self.time = [@"You will be reminded at: " stringByAppendingString:[data objectForKey:@"alertTime"]];
	
	
	self.confirmText.text = self.behavior;
	self.timeText.text = self.time;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)notRight:(UIButton *)sender
{
	NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	[data setBool:false forKey:@"firstTime"];
	[self performSegueWithIdentifier:@"toStart" sender:self];
}

- (IBAction)right:(UIButton *)sender
{
	NSDate *today = [NSDate date];
	
	
	NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	[data setBool:true forKey:@"firstTime"];
	[data setObject: today forKey:@"startDay"];
	
	[self performSegueWithIdentifier:@"toStart" sender:self];
}

@end
