//
//  ProjectCalendar.m
//  mppParser
//
//  Created by George on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProjectCalendar.h"
#import "ProjectFile.h"
#import "Resource.h"

@implementation ProjectCalendar

-(id)init:(ProjectFile *)file
{
    self= [super init];
    if (self)
    {
#warning Incomplete
    }
    
    return self;
}


// Retrieve the resource to which this calendar is linked.
//
// @return resource instance

-(Resource *)getResource
{
#warning Incomplete
    return nil;
}


// Sets the ProjectCalendar instance from which this calendar is derived.
//
// @param calendar base calendar instance

-(void)setParent:(ProjectCalendar *)calendar
{
#warning Incomplete
}

// Returns the defaul base calendar name.
//
+(NSString *)DEFAULT_BASE_CALENDAR_NAME
{
#warning Incomplete
    return @"Standard";
}


// Removes this calendar from the project.

-(void)remove
{
#warning Incomplete
}

// This method is provided to allow an absolute period of time
// represented by start and end dates into a duration in working
// days based on this calendar instance. This method takes account
// of any exceptions defined for this calendar.
//
// @param startDate start of the period
// @param endDate end of the period
// @return new Duration object

-(MPPDuration *)getDuration:(NSDate *)startDate to:(NSDate *)endDate
{
#warning Incomplete
    return nil;
}

@end
