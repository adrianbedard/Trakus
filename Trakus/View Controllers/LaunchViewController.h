//
//  LaunchViewController.h
//  Trakus
//
//  Created by ADRIAN BEDARD on 10/5/13.
//  Copyright (c) 2013 Hi Dev Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "masterArray.h"

@interface LaunchViewController : UIViewController
	//@property (strong, nonatomic) masterArray *data;
@property (strong, nonatomic) NSUserDefaults *masterBehavior;
@property (nonatomic) BOOL firstTime;
@end
