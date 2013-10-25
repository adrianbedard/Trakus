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
@property (strong, nonatomic) NSMutableArray *primaryData;
@property (strong, nonatomic) NSMutableArray *secondaryData;
@property (strong, nonatomic) NSMutableArray *sleepData;
@property (nonatomic) int dayDiff;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
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
	
	self.primaryData = [data objectForKey:@"primaryDataArray"];
	self.secondaryData = [data objectForKey:@"secondaryDataArray"];
	self.sleepData = [data objectForKey:@"sleepDataArray"];
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    NSDate *startDate = [data objectForKey:@"startDay"];
    
	
	
    unsigned flags = NSDayCalendarUnit;
    NSDateComponents *difference = [[NSCalendar currentCalendar] components:flags fromDate:startDate toDate:today options:0];
	
    self.dayDiff = [difference day];


	
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
	
	NSNumber *ratingObject = [NSNumber numberWithInteger:self.rating];
	[self.primaryData replaceObjectAtIndex:self.dayDiff withObject:ratingObject];
	
	NSNumber *occurenceObject = [NSNumber numberWithInteger:self.occurences];
	[self.secondaryData replaceObjectAtIndex:self.dayDiff withObject:occurenceObject];
	
	NSNumber *sleepObject = [NSNumber numberWithInteger:self.sleep];
	[self.sleepData replaceObjectAtIndex:self.dayDiff withObject:sleepObject];
	
	[data setObject:self.primaryData forKey:@"primaryDataArray"];
	[data setObject:self.secondaryData forKey:@"secondaryDataArray"];
	[data setObject:self.sleepData forKey:@"sleepDataArray"];


	self.displayedDate.text = self.printedDate;
}



	
	


@end
