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
@property (nonatomic) int occurencesTemp;
@property (nonatomic) int sleepTemp;
@property (nonatomic) int ratingTemp;
@property (strong, nonatomic) IBOutlet UILabel *sleepLabel;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) NSString *printedDate;
@property (strong, nonatomic) IBOutlet UILabel *occurencesLabel;
@property (strong, nonatomic) IBOutlet UIStepper *counter;
@property (strong, nonatomic) NSString *behavior;
@property (strong, nonatomic) NSString *behavior2;
@property (strong, nonatomic) NSString *behavior3;
@property (nonatomic, retain) NSMutableArray *primaryData;
@property (nonatomic, retain) NSMutableArray *secondaryData;
@property (nonatomic, retain) NSMutableArray *sleepData;
@property (nonatomic) int dayDiff;
@property (nonatomic) NSInteger ratingObject;

@property (strong, nonatomic) IBOutlet UILabel *SecondTitle;
@property (strong, nonatomic) IBOutlet UILabel *Worst2;
@property (strong, nonatomic) IBOutlet UILabel *Best2;
@property (strong, nonatomic) IBOutlet UISlider *Slider2;

@property (strong, nonatomic) IBOutlet UILabel *ThirdTitle;
@property (strong, nonatomic) IBOutlet UISlider *ThirdSlider;
@property (strong, nonatomic) IBOutlet UILabel *Worst3;
@property (strong, nonatomic) IBOutlet UILabel *Best3;


@end

@implementation DataViewController



- (IBAction)storeData:(UIButton *)sender {
	self.rating = self.ratingTemp;
	self.occurences = self.occurencesTemp;
	self.sleep = self.sleepTemp;
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



- (IBAction)ratingSlider:(UISlider *)sender {
	self.ratingTemp = sender.value;
	[self updateUI];
}
- (IBAction)secondRating:(UISlider *)sender {
	self.occurencesTemp = sender.value;
	[self updateUI];
}
- (IBAction)thirdRating:(UISlider *)sender {
	self.sleepTemp = sender.value;
	[self updateUI];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:FALSE];
	// Do any additional setup after loading the view.
	//self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Default BackGround.png"]];
	//UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default BackGround.png"]];
	//	[self.view addSubview:backgroundView];
	
		//self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Default BackGround.png"]];
	//Saves the current date as a string: Today is: MM/dd
	NSDate *today = [NSDate date];
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
	[dateFormat setDateFormat:@"MM/dd"];
	NSString *dateString = [dateFormat stringFromDate:today];
	NSString *todayIs = @"Today is: ";
	self.printedDate = [todayIs stringByAppendingString:dateString];
	
	NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	self.behavior = [data objectForKey:@"behavior"];
	self.behavior2 = [data objectForKey:@"SecondaryBehavior"];
	self.behavior3 = [data objectForKey:@"ThirdBehavior"];

	
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
	self.displayedOccurences.text = [NSString stringWithFormat:@"%d", self.occurencesTemp];
	self.sleepLabel.text = [NSString stringWithFormat:@"Hours slept: %d hours", self.sleepTemp];
	
	
	
	self.ratingLabel.text = [NSString stringWithFormat:@"%@ rating for today: %d", self.behavior, self.ratingTemp];
	
	self.SecondTitle.text = [NSString stringWithFormat:@"%@ rating for today: %d", self.behavior2, self.occurencesTemp];
	
	self.ThirdTitle.text = [NSString stringWithFormat:@"%@ rating for today: %d", self.behavior3, self.sleepTemp];
	
	if([self.behavior2 isEqual:@"N/A"])
		{
		self.SecondTitle.alpha = 0;
		self.Slider2.alpha = 0;
		self.Best2.alpha = 0;
		self.Worst2.alpha = 0;
		self.Slider2.enabled = 0;
		}
	else{
		self.SecondTitle.alpha = 1;
		self.Slider2.alpha = 1;
		self.Best2.alpha = 1;
		self.Worst2.alpha = 1;
		self.Slider2.enabled = 1;
		}
	if([self.behavior3 isEqual:@"N/A"])
		{
		self.ThirdTitle.alpha = 0;
		self.ThirdSlider.alpha = 0;
		self.Best3.alpha = 0;
		self.Worst3.alpha = 0;
		self.ThirdSlider.enabled = 0;
		}
	else
		{
		self.ThirdTitle.alpha = 1;
		self.ThirdSlider.alpha = 1;
		self.Best3.alpha = 1;
		self.Worst3.alpha = 1;
		self.ThirdSlider.enabled = 1;
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
