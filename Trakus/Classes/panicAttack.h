//
//  panicAttack.h
//  Trakus
//
//  Created by ADRIAN BEDARD on 10/7/13.
//  Copyright (c) 2013 Hi Dev Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface panicAttack : NSObject

	//panicLevel is an integer describing the panic for a day
	//panicEvents is an integer describing the panic events for a day
@property (nonatomic) NSUInteger *panicLevel;
@property (nonatomic) NSUInteger *panicEvents;

@end
