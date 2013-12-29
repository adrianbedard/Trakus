//
//  DataViewController.m
//  Trakus
//
//  Created by ADRIAN BEDARD on 10/5/13.
//  Copyright (c) 2013 Hi Dev Mobile. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()
@property (strong, nonatomic) IBOutlet UILabel *displayedOccurences;
@property (strong, nonatomic) IBOutlet UILabel *displayedDate;
@property (nonatomic) int occurences;
@property (nonatomic) int sleep;
@property (nonatomic) int rating;
@property (strong, nonatomic) IBOutlet UILabel *sleepLabel;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) NSString *printedDate;
@property (strong, nonatomic) IBOutlet UILabel *occurencesLabel;
@property (strong, nonatomic) IBOutlet UIStepper *counter;
@property (strong, nonatomic) NSString *behavior;
@property (nonatomic, retain) NSMutableArray *primaryData;
@property (nonatomic, retain) NSMutableArray *secondaryData;
@property (nonatomic, retain) NSMutableArray *sleepData;
@property (nonatomic) int dayDiff;
@property (nonatomic) NSInteger ratingObject;
@end

@implementation DataViewController

- (IBAction)occurencesChanged:(UIStepper *)sender
{
	self.occurences = [sender value];
	[self updateUI];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)sleepSlider:(UISlider *)sender {
	self.sleep = sender.value;
	[self updateUI];
}

- (IBAction)ratingSlider:(UISlider *)sender {
	self.rating = sender.value;
	[self updateUI];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:FALSE];
	// Do any additional setup after loading the view.
	
	//Saves the current date as a string: Today is: MM/dd
	NSDate *today = [NSDate date];
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
	[dateFormat setDateFormat:@"MM/dd"];
	NSString *dateString = [dateFormat stringFromDate:today];
	NSString *todayIs = @"Today is: ";
	self.printedDate = [todayIs stringByAppendingString:dateString];
	
	NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	self.behavior = [data objectForKey:@"behavior"];
	
	/*self.primaryData = [[NSMutableArray alloc]init];
	self.secondaryData = [[NSMutableArray alloc]init];
	self.sleepData = [[NSMutableArray alloc]init];
	 */
	
	self.primaryData = [data objectForKey:@"primaryDataArray"];
	self.secondaryData = [data objectForKey:@"secondaryDataArray"];
	self.sleepData = [data objectForKey:@"sleepDataArray"];
	
		
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    NSDate *startDate = [data objectForKey:@"startDay"];
    
	
	
    unsigned flags = NSDayCalendarUnit;
    NSDateComponents *difference = [[NSCalendar currentCalendar] components:flags fromDate:startDate toDate:today options:0];
	
    self.dayDiff = [difference day];
		//plist testing
	/*while(self.primaryData.count <= self.dayDiff)
		{
		if(self.primaryData.count == 0)
			{
			[self.primaryData addObject:[NSNumber numberWithInt:-1]];
			[self.secondaryData insertObject:[NSNumber numberWithInt:-1] atIndex:self.secondaryData.count];
			[self.sleepData insertObject:[NSNumber numberWithInt:-1] atIndex:self.sleepData.count];
			}
		else
			{
			[self.primaryData insertObject:[NSNumber numberWithInt:-1] atIndex:self.primaryData.count-1];
			[self.secondaryData insertObject:[NSNumber numberWithInt:-1] atIndex:self.secondaryData.count-1];
			[self.sleepData insertObject:[NSNumber numberWithInt:-1] atIndex:self.sleepData.count-1];
			}
		}
	 */


	
	[self updateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateUI
{
				NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	//update the UI
	self.displayedOccurences.text = [NSString stringWithFormat:@"%d", self.occurences];
	self.sleepLabel.text = [NSString stringWithFormat:@"Hours slept: %d hours", self.sleep];
	
	
	
	self.ratingLabel.text = [NSString stringWithFormat:@"%@ rating for today: %d", self.behavior, self.rating];
	
	self.occurencesLabel.alpha = 1;
	self.displayedOccurences.alpha = 1;
	self.counter.alpha = 1;
	self.counter.enabled = true;
	
	if([self.behavior isEqualToString:@"Anxiety"] || [self.behavior isEqualToString:@"Mood"])
		{
		self.occurencesLabel.alpha = 0;
		self.displayedOccurences.alpha = 0;
		self.counter.alpha = 0;
		self.counter.enabled = false;
		}
	
	
	NSMutableArray *primaryHolder = [[NSMutableArray alloc] initWithArray:self.primaryData];
	NSMutableArray *secondaryHolder = [[NSMutableArray alloc] initWithArray:self.secondaryData];
	NSMutableArray *sleepHolder = [[NSMutableArray alloc] initWithArray:self.sleepData];
	
	while(primaryHolder.count < self.dayDiff+1)
		{
		[primaryHolder addObject:@"N/A"];
		}
	while(secondaryHolder.count < self.dayDiff+1)
		{
		[secondaryHolder addObject:@"N/A"];
		}
	while(sleepHolder.count < self.dayDiff+1)
		{
		[sleepHolder addObject:@"N/A"];
		}
	
	[primaryHolder replaceObjectAtIndex:self.dayDiff withObject:[[NSString alloc]initWithFormat: @"%d",self.rating]];
	
	[secondaryHolder replaceObjectAtIndex:self.dayDiff withObject:[[NSString alloc]initWithFormat: @"%d",self.occurences]];
	
	[sleepHolder replaceObjectAtIndex:self.dayDiff withObject:[[NSString alloc]initWithFormat: @"%d",self.sleep]];
	
	
	self.primaryData = primaryHolder;
	
	self.secondaryData = secondaryHolder;
	
	self.sleepData = sleepHolder;
	
	/*self.primaryData = [[NSMutableArray alloc] initWithArray:@[@"0",@"3",@"6",@"4",@"9",@"8",@"1",@"2",@"3",@"0",@"0",@"6",@"0",@"2",@"3",@"0",@"1",@"7",@"10",@"5",@"0"]];
	self.secondaryData = [[NSMutableArray alloc] initWithArray:@[@"0",@"3",@"6",@"4",@"9",@"8",@"1",@"2",@"3",@"0",@"0",@"6",@"0",@"2",@"3",@"0",@"1",@"7",@"10",@"5",@"0"]];
	self.sleepData = [[NSMutableArray alloc] initWithArray:@[@"0",@"3",@"6",@"4",@"9",@"8",@"1",@"2",@"3",@"0",@"0",@"6",@"0",@"2",@"3",@"0",@"1",@"7",@"10",@"5",@"0"]];
	*/
	
	NSLog (@"%@",self.primaryData[self.dayDiff]);
	
		[data setObject:self.primaryData forKey:@"primaryDataArray"];
		[data setObject:self.secondaryData forKey:@"secondaryDataArray"];
		[data setObject:self.sleepData forKey:@"sleepDataArray"];
	[data setDouble:self.dayDiff forKey:@"dayDiff"];


	self.displayedDate.text = self.printedDate;
}



	
	


@end
