//
//  masterArray.h
//  Trakus
//
//  Created by ADRIAN BEDARD on 10/5/13.
//  Copyright (c) 2013 Hi Dev Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface masterArray : NSObject

	//startDay is the day that the monitoring begins
	//monitoredBehavior is a string indicating what behavior is tracked
	//behaviorData is an array holding behavior objects
	//sleepData is an array holding sleep objects
@property (strong, nonatomic) NSDate *startDay;
@property (strong, nonatomic) NSString *monitoredBehavior;
@property (strong, nonatomic) NSMutableArray *behaviorData;
@property (strong, nonatomic) NSMutableArray *sleepData;
@property (strong, nonatomic) NSMutableArray *extraData;
@property (nonatomic) bool *eventCount;
@property (nonatomic) bool firstTime;


@end
