//
//  LaunchViewController.m
//  Trakus
//
//  Created by ADRIAN BEDARD on 10/5/13.
//  Copyright (c) 2013 Hi Dev Mobile. All rights reserved.
//

#import "LaunchViewController.h"
#import "testVC.h"


@interface LaunchViewController ()



@end

@implementation LaunchViewController

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


-(void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
		//additional
	
	
	
	NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	self.firstTime = [data boolForKey:@"firstTime"];
	
	if(!self.firstTime)
		{
			[self performSegueWithIdentifier:@"toSetup" sender:self];
		
		
		}
	else{
			//gotodata
		
			[self performSegueWithIdentifier:@"toData" sender:self];
			
				
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
