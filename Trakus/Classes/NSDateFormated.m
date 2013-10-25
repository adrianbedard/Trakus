//
//  NSDateFormated.m
//  Trakus
//
//  Created by ADRIAN BEDARD on 10/21/13.
//  Copyright (c) 2013 Hi Dev Mobile. All rights reserved.
//

#import "NSDateFormated.h"


@implementation NSDateFormated
-(int)dateDiffrenceFromDate:(NSString *)date1 second:(NSString *)date2 {
		// Manage Date Formation same for both dates
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    NSDate *startDate = [formatter dateFromString:date1];
    NSDate *endDate = [formatter dateFromString:date2];
	
	
    unsigned flags = NSDayCalendarUnit;
    NSDateComponents *difference = [[NSCalendar currentCalendar] components:flags fromDate:startDate toDate:endDate options:0];
	
    int dayDiff = [difference day];
	
   
	return dayDiff;
}
@end
