//
//  emailViewController.m
//  Trakus
//
//  Created by ADRIAN BEDARD on 12/26/13.
//  Copyright (c) 2013 Hi Dev Mobile. All rights reserved.
//

#import "emailViewController.h"

@interface emailViewController ()

@end

@implementation emailViewController

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
	self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Default BackGround.png"]];
	NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
	
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
