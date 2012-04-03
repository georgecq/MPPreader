//
//  Resource.m
//  mppParser
//
//  Created by George on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Resource.h"
#import "ResourceAssignment.h"
#import "ProjectCalendar.h"
#import "ProjectFile.h"

@implementation Resource

@synthesize ID;
@synthesize UniqueID;

-(id)init:(ProjectFile *)file
{
    self= [super init];
    if (self)
    {
#warning Incomplete
    }
    
    return self;
}

// Internal method used as part of the process of removing a resource
// assignment.
// 
// @param assignment resource assignment to be removed

-(void)removeResourceAssignment:(ResourceAssignment*) assignment
{
#warning Incomplete
}


// This method allows a pre-existing resource calendar to be attached to a
// resource.
// 
// @param calendar resource calendar

-(void)setResourceCalendar:(ProjectCalendar *)calendar
{
#warning Incomplete
}


// Gets Unique ID field value.
// 
// @return value

-(int)getUniqueID
{
#warning Incomplete
    return 0;
}


// Gets ID field value.
// 
// @return value

-(int)getID
{
#warning Incomplete
    return 0;
}


// This method retrieves the calendar associated with this resource.
// 
// @return ProjectCalendar instance

-(ProjectCalendar *)getResourceCalendar
{
#warning Incomplete
    return nil;
}

@end
