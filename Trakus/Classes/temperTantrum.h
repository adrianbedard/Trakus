//
//  temperTantrum.h
//  Trakus
//
//  Created by ADRIAN BEDARD on 10/7/13.
//  Copyright (c) 2013 Hi Dev Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface temperTantrum : NSObject

	//temperLevel is an integer describing the temper for a day
	//temperEvents in an integer describing the number of incidents in a day
@property (nonatomic) NSUInteger *temperLevel;
@property (nonatomic) NSUInteger *temperEvents;

@end
