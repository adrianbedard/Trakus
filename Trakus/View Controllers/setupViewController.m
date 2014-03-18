//
//  setupViewController.m
//  Trakus
//
//  Created by ADRIAN BEDARD on 10/7/13.
//  Copyright (c) 2013 Hi Dev Mobile. All rights reserved.
//

#import "setupViewController.h"



@interface setupViewController ()
@property (strong, nonatomic) NSString* behaviorOne;
@property (strong, nonatomic) NSString* behaviorTwo;
@property (strong, nonatomic) NSString* behaviorThree;
@property (strong, nonatomic) IBOutlet UIButton *anxiety;
@property (strong, nonatomic) IBOutlet UIButton *sleep;
@property (strong, nonatomic) IBOutlet UIButton *panicAttacks;
@property (strong, nonatomic) IBOutlet UIButton *mood;
@property (strong, nonatomic) IBOutlet UIButton *temperTantrums;
@property (strong, nonatomic) IBOutlet UIButton *aggression;

@end

@implementation setupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		//self.behaviors = @[@"Anxiety", @"Panic Attacks", @"Aggression", @"Mood", @"Temper"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	//self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Default BackGround.png"]];
	/*
	UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TrakusTab1.1.png"]];
	
	[self.view addSubview:backgroundView];
	[self.view sendSubviewToBack:backgroundView];
	 */
	self.behaviorOne = @"N/A";
	self.behaviorTwo = @"N/A";
	self.behaviorThree = @"N/A";
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sleep:(UIButton *)sender {
	if(![self.behaviorOne  isEqual: @"Sleep"] && ![self.behaviorTwo isEqual: @"Sleep"] && ![self.behaviorThree  isEqual: @"Sleep"])
		{
		self.sleep.alpha = 0.5;
		if([self.behaviorOne isEqual: @"N/A"])
			{
			self.behaviorOne = @"Sleep";
			}
		else if([self.behaviorTwo isEqual: @"N/A"])
			{
			self.behaviorTwo = @"Sleep";
			}
		else if([self.behaviorThree isEqual: @"N/A"])
			{
			self.behaviorThree = @"Sleep";
			}
		else
			{
			self.sleep.alpha = 1;
			}
		
		}
	else{
		self.sleep.alpha = 1;
		if([self.behaviorOne isEqual:@"Sleep"])
			{
			self.behaviorOne = @"N/A";
			}
		
		if([self.behaviorTwo isEqual:@"Sleep"])
			{
			self.behaviorTwo = @"N/A";
			}
		
		if([self.behaviorThree isEqual:@"Sleep"])
			{
			self.behaviorThree = @"N/A";
			}
	}
	
		//[self performSegueWithIdentifier:@"toSetup2" sender:self];
	NSLog (@"%@, %@, %@/n",self.behaviorOne, self.behaviorTwo, self.behaviorThree);
}

- (IBAction)anxiety:(UIButton *)sender
{
	if(![self.behaviorOne  isEqual: @"Anxiety"] && ![self.behaviorTwo isEqual: @"Anxiety"] && ![self.behaviorThree  isEqual: @"Anxiety"])
		{
		self.anxiety.alpha = 0.5;
		if([self.behaviorOne isEqual: @"N/A"])
			{
			self.behaviorOne = @"Anxiety";
			}
		else if([self.behaviorTwo isEqual: @"N/A"])
			{
			self.behaviorTwo = @"Anxiety";
			}
		else if([self.behaviorThree isEqual: @"N/A"])
			{
			self.behaviorThree = @"Anxiety";
			}
		else
			{
			self.anxiety.alpha = 1;
			}
		
		}
	else{
		self.anxiety.alpha = 1;
		if([self.behaviorOne isEqual:@"Anxiety"])
			{
			self.behaviorOne = @"N/A";
			}
		
		if([self.behaviorTwo isEqual:@"Anxiety"])
			{
			self.behaviorTwo = @"N/A";
			}
		
		if([self.behaviorThree isEqual:@"Anxiety"])
			{
			self.behaviorThree = @"N/A";
			}
	}
	

	
		//[self performSegueWithIdentifier:@"toSetup2" sender:self];
	NSLog (@"%@, %@, %@/n",self.behaviorOne, self.behaviorTwo, self.behaviorThree);
}


- (IBAction)panicAttacks:(UIButton *)sender
{
	if(![self.behaviorOne  isEqual: @"Panic Attacks"] && ![self.behaviorTwo isEqual: @"Panic Attacks"] && ![self.behaviorThree  isEqual: @"Panic Attacks"])
		{
		self.panicAttacks.alpha = 0.5;
		if([self.behaviorOne isEqual: @"N/A"])
			{
			self.behaviorOne = @"Panic Attacks";
			}
		else if([self.behaviorTwo isEqual: @"N/A"])
			{
			self.behaviorTwo = @"Panic Attacks";
			}
		else if([self.behaviorThree isEqual: @"N/A"])
			{
			self.behaviorThree = @"Panic Attacks";
			}
		else
			{
			self.panicAttacks.alpha = 1;
			}
		
		}
	else{
		self.panicAttacks.alpha = 1;
		if([self.behaviorOne isEqual:@"Panic Attacks"])
			{
			self.behaviorOne = @"N/A";
			}
		
		if([self.behaviorTwo isEqual:@"Panic Attacks"])
			{
			self.behaviorTwo = @"N/A";
			}
		
		if([self.behaviorThree isEqual:@"Panic Attacks"])
			{
			self.behaviorThree = @"N/A";
			}
	}
	
	
		//[self performSegueWithIdentifier:@"toSetup2" sender:self];
	NSLog (@"%@, %@, %@/n",self.behaviorOne, self.behaviorTwo, self.behaviorThree);
}
- (IBAction)aggro:(UIButton *)sender {
	if(![self.behaviorOne  isEqual: @"Aggression"] && ![self.behaviorTwo isEqual: @"Aggression"] && ![self.behaviorThree  isEqual: @"Aggression"])
		{
		self.aggression.alpha = 0.5;
		if([self.behaviorOne isEqual: @"N/A"])
			{
			self.behaviorOne = @"Aggression";
			}
		else if([self.behaviorTwo isEqual: @"N/A"])
			{
			self.behaviorTwo = @"Aggression";
			}
		else if([self.behaviorThree isEqual: @"N/A"])
			{
			self.behaviorThree = @"Aggression";
			}
		else
			{
			self.aggression.alpha = 1;
			}
		
		}
	else{
		self.aggression.alpha = 1;
		if([self.behaviorOne isEqual:@"Aggression"])
			{
			self.behaviorOne = @"N/A";
			}
		
		if([self.behaviorTwo isEqual:@"Aggression"])
			{
			self.behaviorTwo = @"N/A";
			}
		
		if([self.behaviorThree isEqual:@"Aggression"])
			{
			self.behaviorThree = @"N/A";
			}
	}
	NSLog (@"%@, %@, %@/n",self.behaviorOne, self.behaviorTwo, self.behaviorThree);
	
}



- (IBAction)temperTantrums:(UIButton *)sender
{
	if(![self.behaviorOne  isEqual: @"Temper Tantrums"] && ![self.behaviorTwo isEqual: @"Temper Tantrums"] && ![self.behaviorThree  isEqual: @"Temper Tantrums"])
		{
		self.temperTantrums.alpha = 0.5;
		if([self.behaviorOne isEqual: @"N/A"])
			{
			self.behaviorOne = @"Temper Tantrums";
			}
		else if([self.behaviorTwo isEqual: @"N/A"])
			{
			self.behaviorTwo = @"Temper Tantrums";
			}
		else if([self.behaviorThree isEqual: @"N/A"])
			{
			self.behaviorThree = @"Temper Tantrums";
			}
		else
			{
			self.temperTantrums.alpha = 1;
			}
		
		}
	else{
		self.temperTantrums.alpha = 1;
		if([self.behaviorOne isEqual:@"Temper Tantrums"])
			{
			self.behaviorOne = @"N/A";
			}
		
		if([self.behaviorTwo isEqual:@"Temper Tantrums"])
			{
			self.behaviorTwo = @"N/A";
			}
		
		if([self.behaviorThree isEqual:@"Temper Tantrums"])
			{
			self.behaviorThree = @"N/A";
			}
	}
	
	NSLog (@"%@, %@, %@/n",self.behaviorOne, self.behaviorTwo, self.behaviorThree);
		//[self performSegueWithIdentifier:@"toSetup2" sender:self];
}

- (IBAction)mood:(UIButton *)sender
{
	if(![self.behaviorOne  isEqual: @"Mood"] && ![self.behaviorTwo isEqual: @"Mood"] && ![self.behaviorThree  isEqual: @"Mood"])
		{
		self.mood.alpha = 0.5;
		if([self.behaviorOne isEqual: @"N/A"])
			{
			self.behaviorOne = @"Mood";
			}
		else if([self.behaviorTwo isEqual: @"N/A"])
			{
			self.behaviorTwo = @"Mood";
			}
		else if([self.behaviorThree isEqual: @"N/A"])
			{
			self.behaviorThree = @"Mood";
			}
		else
			{
			self.mood.alpha = 1;
			}
		
		}
	else{
		self.mood.alpha = 1;
		if([self.behaviorOne isEqual:@"Mood"])
			{
			self.behaviorOne = @"N/A";
			}
		
		if([self.behaviorTwo isEqual:@"Mood"])
			{
			self.behaviorTwo = @"N/A";
			}
		
		if([self.behaviorThree isEqual:@"Mood"])
			{
			self.behaviorThree = @"N/A";
			}
	}
	
	NSLog (@"%@, %@, %@/n",self.behaviorOne, self.behaviorTwo, self.behaviorThree);
}
- (IBAction)continue:(UIButton *)sender {
	if([self.behaviorOne isEqual:@"N/A"] && [self.behaviorTwo isEqual:@"N/A"] && [self.behaviorThree isEqual:@"N/A"])
		{
		
		}
	
	else{
		while([self.behaviorOne isEqual:@"N/A"])
			{
			if([self.behaviorOne isEqual:@"N/A"])
				{
				self.behaviorOne = self.behaviorTwo;
				self.behaviorTwo = self.behaviorThree;
				self.behaviorThree = @"N/A";
				}
			}
		NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
		[data setObject: self.behaviorOne forKey:@"behavior"];
		
			[data setObject: self.behaviorTwo forKey:@"SecondaryBehavior"];
			
			[data setObject: self.behaviorThree forKey:@"ThirdBehavior"];
			
		NSLog (@"%@, %@, %@/n",self.behaviorOne, self.behaviorTwo, self.behaviorThree);

			[self performSegueWithIdentifier:@"toSetup2" sender:self];
	}
	}


@end
