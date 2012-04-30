//
//  ResourceAssignment.m
//  mppParser
//
//  Created by George on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ResourceAssignment.h"

#import "Task.h"
#import "Resource.h"

@implementation ResourceAssignment

@synthesize UniqueID;

// Constructor.
//
// @param file The parent file to which this record belongs.
// @param task The task to which this assignment is being made

-(id)init:(ProjectFile *)file with:(Task *)task
{
    self= [super init];
    if (self)
    {
#warning Incomplete
    }
    
    return self;
}


// This method retrieves a reference to the task with which this
// assignment is associated.
//
// @return task

-(Task*) getTask
{
#warning Incomplete
    return nil;
}


// This method retrieves a reference to the resource with which this
// assignment is associated.
//
// @return resource

-(Resource*)getResource
{
#warning Incomplete
    return nil;
}


// Returns the resources unique id for this resource assignment.
//
// @return resources unique id

-(int)getResourceUniqueID
{
#warning Incomplete
    return 0;
}

@end
