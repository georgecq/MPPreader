//
//  ProjectCalendarWeek.m
//  mppParser
//
//  Created by George on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProjectCalendarWeek.h"
#import "Day.h"
#import "DayType.h"

@implementation ProjectCalendarWeek

@synthesize Name;

// convenience method for setting working or non-working days.
//
// @param day required day
// @param working flag indicating if the day is a working day
-(void)setWorkingDay:(Day *)day   AsWorking:(Boolean)working
{
    if (working) 
    {
        [self setWorkingDay:day withType:[DayType WORKING]];
    }
    else 
    {
        [self setWorkingDay:day withType:[DayType NON_WORKING]];
    }
}


// This is a convenience method provided to allow a day to be set
// as working or non-working, by using the day number to
// identify the required day.
//
// @param day required day
// @param working flag indicating if the day is a working day

-(void)setWorkingDay:(Day *)day  withType:(DayType *)workingType
{
#warning Incomplete
}

// This is a convenience method used to add a default set of calendar
// hours to a calendar.

-(void)addDefaultCalendarHours
{
#warning Incomplete 
}

@end
