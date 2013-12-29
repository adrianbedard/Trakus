//
//  calendarViewController.m
//  Trakus
//
//  Created by ADRIAN BEDARD on 10/21/13.
//  Copyright (c) 2013 Hi Dev Mobile. All rights reserved.
//

#import "calendarViewController.h"

@interface calendarViewController ()
	//@property (strong, nonatomic) IBOutlet UILabel *dataCheck2;
@property (strong, nonatomic) NSString *fu;
@property (retain, nonatomic) NSMutableArray *primaryData;
@property (retain, nonatomic) NSMutableArray *secondaryData;
@property (retain, nonatomic) NSMutableArray *sleepData;
@property (strong, nonatomic) IBOutlet UILabel *primaryDataLabel;
@property (strong, nonatomic) IBOutlet UILabel *secondaryDataLabel;
@property (strong, nonatomic) IBOutlet UILabel *sleepDataLabel;
@property (nonatomic) int dayDiff;
@property (nonatomic) int dateEdit;
@property (nonatomic) int occurences;
@property (nonatomic) int sleep;
@property (nonatomic) int rating;
@property (nonatomic) BOOL dateChange;
@property (strong, nonatomic) IBOutlet UILabel *aTitleCalendar;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UISlider *primarySlider;
@property (strong, nonatomic) IBOutlet UISlider *sleepSlider;
@property (strong, nonatomic) IBOutlet UIStepper *secondaryStepper;

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
- (IBAction)primarySlider:(UISlider *)sender {
	
	self.rating = sender.value;
	[self updateUI];
}

- (IBAction)secondaryStepper:(UIStepper *)sender {
	self.occurences = sender.value;
	[self updateUI];
}

- (IBAction)sleepSlider:(UISlider *)sender {
	self.sleep = sender.value;
	[self updateUI];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	self.dateChange = false;
	self.dayDiff = [[data objectForKey:@"dayDiff"] intValue];
	self.dateEdit = self.dayDiff;
	
	self.primaryData = [data objectForKey:@"primaryDataArray"];
	self.secondaryData = [data objectForKey:@"secondaryDataArray"];
	self.sleepData = [data objectForKey:@"sleepDataArray"];
	
	self.secondaryDataLabel.text = [NSString stringWithFormat:@"Secondary Data: %@", self.secondaryData[self.dateEdit]];
	self.sleepDataLabel.text = [NSString stringWithFormat:@"Hours slept: %@ hours", self.sleepData[self.dateEdit]];
	
	
	
	self.primaryDataLabel.text = [NSString stringWithFormat:@"Primary Data: %@", self.primaryData[self.dateEdit]];
	[self updateUI];
}



-(void)updateUI
{
		//update the UI
	NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	
		//NSDate *today = [NSDate date];
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
	[dateFormat setDateFormat:@"MM/dd"];
	NSString *dateString = [dateFormat stringFromDate:self.datePicker.date];
	NSString *todayIs = @"Data for: ";
	self.aTitleCalendar.text = [todayIs stringByAppendingString:dateString];
	NSDate *startDate = [data objectForKey:@"startDay"];
	unsigned flags = NSDayCalendarUnit;
	NSDateComponents *difference = [[NSCalendar currentCalendar] components:flags fromDate:startDate toDate:self.datePicker.date options:0];
	
    self.dateEdit = [difference day];
	
	if(self.dateEdit < 0 || self.dateEdit > self.dayDiff)
		{
		self.dateEdit = 0;
		}
	
	self.secondaryDataLabel.text = [NSString stringWithFormat:@"Secondary Data: %@", self.secondaryData[self.dateEdit]];
	self.sleepDataLabel.text = [NSString stringWithFormat:@"Hours slept: %@ hours", self.sleepData[self.dateEdit]];
	
	
	
	self.primaryDataLabel.text = [NSString stringWithFormat:@"Primary Data: %@", self.primaryData[self.dateEdit]];
	
		//self.occurencesLabel.alpha = 1;
		//self.displayedOccurences.alpha = 1;
		//self.counter.alpha = 1;
		//self.counter.enabled = true;
	
	/*if([self.behavior isEqualToString:@"Anxiety"] || [self.behavior isEqualToString:@"Mood"])
		{
		self.occurencesLabel.alpha = 0;
		self.displayedOccurences.alpha = 0;
		self.counter.alpha = 0;
		self.counter.enabled = false;
		}
	*/
	
	NSMutableArray *primaryHolder = [[NSMutableArray alloc] initWithArray:self.primaryData];
	NSMutableArray *secondaryHolder = [[NSMutableArray alloc] initWithArray:self.secondaryData];
	NSMutableArray *sleepHolder = [[NSMutableArray alloc] initWithArray:self.sleepData];
	
	while(primaryHolder.count < self.dayDiff+1)
		{
		[primaryHolder addObject:@"N/A"];
		[secondaryHolder addObject:@"N/A"];
		[sleepHolder addObject:@"N/A"];
		}
	if(!self.dateChange)
		{
	[primaryHolder replaceObjectAtIndex:self.dateEdit withObject:[[NSString alloc]initWithFormat: @"%d",self.rating]];
	
	[secondaryHolder replaceObjectAtIndex:self.dateEdit withObject:[[NSString alloc]initWithFormat: @"%d",self.occurences]];
	
	[sleepHolder replaceObjectAtIndex:self.dateEdit withObject:[[NSString alloc]initWithFormat: @"%d",self.sleep]];
		}
	else
		{
		self.primarySlider.value = [self.primaryData[self.dateEdit] integerValue];
		self.secondaryStepper.value = [self.secondaryData[self.dateEdit] integerValue];
		self.sleepSlider.value = [self.sleepData[self.dateEdit] integerValue];
		}
	
	self.primaryData = primaryHolder;
	
	self.secondaryData = secondaryHolder;
	
	self.sleepData = sleepHolder;
	
	/*self.primaryData = [[NSMutableArray alloc] initWithArray:@[@"0",@"3",@"6",@"4",@"9",@"8",@"1",@"2",@"3",@"0",@"0",@"6",@"0",@"2",@"3",@"0",@"1",@"7",@"10",@"5",@"0"]];
	 self.secondaryData = [[NSMutableArray alloc] initWithArray:@[@"0",@"3",@"6",@"4",@"9",@"8",@"1",@"2",@"3",@"0",@"0",@"6",@"0",@"2",@"3",@"0",@"1",@"7",@"10",@"5",@"0"]];
	 self.sleepData = [[NSMutableArray alloc] initWithArray:@[@"0",@"3",@"6",@"4",@"9",@"8",@"1",@"2",@"3",@"0",@"0",@"6",@"0",@"2",@"3",@"0",@"1",@"7",@"10",@"5",@"0"]];
	 */
	
	NSLog (@"%@",self.secondaryData[self.dateEdit]);
	
	[data setObject:self.primaryData forKey:@"primaryDataArray"];
	[data setObject:self.secondaryData forKey:@"secondaryDataArray"];
	[data setObject:self.sleepData forKey:@"sleepDataArray"];
		//[data setDouble:self.dayDiff forKey:@"dayDiff"];
	
	
		//self.displayedDate.text = self.printedDate;

	self.dateChange = false;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)datePicker:(id)sender {
	self.dateChange = TRUE;
	[self updateUI];
}
@end
