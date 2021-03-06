//
//  resetViewController.m
//  Trakus
//
//  Created by ADRIAN BEDARD on 10/10/13.
//  Copyright (c) 2013 Hi Dev Mobile. All rights reserved.
//

#import "resetViewController.h"

@interface resetViewController ()
@property (strong, nonatomic) IBOutlet UIDatePicker *alertTime;
@end

@implementation resetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)resetSegue:(id)sender
{
	NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	[data setBool:true forKey:@"firstTime"];
	[data setObject:Nil forKey:@"primaryDataArray"];
	[data setObject:Nil forKey:@"secondaryDataArray"];
	[data setObject:Nil forKey:@"sleepDataArray"];
	[self performSegueWithIdentifier:@"reset" sender:nil];
}
- (IBAction)alertTimer:(UIDatePicker *)sender {
	
	NSTimeInterval alertGap = [self.alertTime.date timeIntervalSince1970];
	NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	[data setDouble:alertGap forKey:@"notificationTime"];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	//self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Default BackGround.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
