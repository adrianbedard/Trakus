//
//  calendarViewController.m
//  Trakus
//
//  Created by ADRIAN BEDARD on 10/21/13.
//  Copyright (c) 2013 Hi Dev Mobile. All rights reserved.
//

#import "calendarViewController.h"

@interface calendarViewController ()
@property (strong, nonatomic) IBOutlet UILabel *dataCheck;
@property (strong, nonatomic) NSString *fu;
@property (strong, nonatomic) NSMutableArray *primaryData;
@property (strong, nonatomic) NSMutableArray *secondaryData;
@property (strong, nonatomic) NSMutableArray *sleepData;

@end

@implementation calendarViewController

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
	self.primaryData = [data objectForKey:@"primaryDataArray"];
	self.secondaryData = [data objectForKey:@"secondaryDataArray"];
	self.sleepData = [data objectForKey:@"sleepDataArray"];
	
	for(int i = 0; i < self.primaryData.count; i++)
		{
		NSNumber *datum = [self.primaryData objectAtIndex:i];
		int yourInteger = [datum intValue];
		NSString *test = [NSString stringWithFormat:@"%d\n", yourInteger];
		self.fu = [self.fu stringByAppendingString:test];
		}
	self.dataCheck.text = self.fu;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
