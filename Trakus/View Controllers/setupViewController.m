//
//  setupViewController.m
//  Trakus
//
//  Created by ADRIAN BEDARD on 10/7/13.
//  Copyright (c) 2013 Hi Dev Mobile. All rights reserved.
//

#import "setupViewController.h"



@interface setupViewController ()


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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sleep:(UIButton *)sender {
	NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	[data setObject:@"sleep" forKey:@"behavior"];
	
	[self performSegueWithIdentifier:@"toSetup2" sender:self];
}

- (IBAction)anxiety:(UIButton *)sender
{
	NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	[data setObject:@"Anxiety" forKey:@"behavior"];
	
	[self performSegueWithIdentifier:@"toSetup2" sender:self];
}


- (IBAction)panicAttacks:(UIButton *)sender
{
	NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	[data setObject:@"Panic attacks" forKey:@"behavior"];
	
	[self performSegueWithIdentifier:@"toSetup2" sender:self];
}

- (IBAction)aggression:(UIButton *)sender
{
	NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	[data setObject:@"Aggression" forKey:@"behavior"];
	
	[self performSegueWithIdentifier:@"toSetup2" sender:self];
}

- (IBAction)temperTantrums:(UIButton *)sender
{
	NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	[data setObject:@"Temper tantrums" forKey:@"behavior"];
	
	[self performSegueWithIdentifier:@"toSetup2" sender:self];
}

- (IBAction)mood:(UIButton *)sender
{
	NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	[data setObject:@"Mood" forKey:@"behavior"];
	
	[self performSegueWithIdentifier:@"toSetup2" sender:self];
}


@end
