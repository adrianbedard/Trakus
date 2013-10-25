//
//  aggression.h
//  Trakus
//
//  Created by ADRIAN BEDARD on 10/7/13.
//  Copyright (c) 2013 Hi Dev Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface aggression : NSObject

	//aggressionLevel is an integer describing the aggression for a given day
	//aggresionEvents is an integer describing the number of events in a day
@property (nonatomic) NSUInteger *aggressionLevel;
@property (nonatomic) NSUInteger *aggressionEvents;

@end
