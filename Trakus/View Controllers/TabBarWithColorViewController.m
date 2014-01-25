//
//  TabBarWithColorViewController.m
//  Trakus
//
//  Created by ADRIAN BEDARD on 1/14/14.
//  Copyright (c) 2014 Hi Dev Mobile. All rights reserved.
//

#import "TabBarWithColorViewController.h"

@interface TabBarWithColorViewController ()

@end

@implementation TabBarWithColorViewController

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
	//self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Default BackGround.png"]];
	UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TrakusTab1.1.png"]];

	[self.view addSubview:backgroundView];
	[self.view sendSubviewToBack:backgroundView];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
