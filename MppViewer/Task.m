//
//  Task.m
//  mppParser
//
//  Created by George on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Task.h"
#import "ProjectFile.h"
#import "ResourceAssignment.h"

@implementation Task

@synthesize ID;
@synthesize UniqueID;
@synthesize Milestone;
@synthesize ActualFinish;
@synthesize Finish;
@synthesize ActualStart;
@synthesize Start;

// Default constructor.
//
// @param file Parent file to which this record belongs.
// @param parent Parent task

-(id)init:(ProjectFile *) file withParent:(Task *) parent
{
    self= [super init];
    if (self)
    {
#warning Incomplete
    }
    
    return self;
}



// The ID field contains the identifier number that Microsoft Project
// automatically assigns to each task as you add it to the project.
// The ID indicates the position of a task with respect to the other tasks.
//
// @return the task ID

-(int)getID
{ 
#warning Incomplete    
    return 0;
}


// This method retrieves a reference to the parent of this task, as
// defined by the outline level. If this task is at the top level,
// this method will return null.
//
// @return parent task

-(Task *)getParentTask
{
#warning Incomplete    
    return nil;
}


// Removes a child task.
//
// @param child child task instance

-(void)removeChildTask:(Task *) child
{
#warning Incomplete
}


// This method retrieves a list of child tasks relative to the
// current task, as defined by the outine level. If there
// are no child tasks, this method will return an empty list.
//
// @return child tasks

-(NSMutableArray *)getChildTasks
{
#warning Incomplete    
    return nil;
}


// Internal method used as part of the process of removing a
// resource assignment.
//
// @param assignment resource assignment to be removed

-(void)removeResourceAssignment:(ResourceAssignment *)assignment
{
#warning Incomplete 
}


// This method allows the list of child tasks to be cleared in preparation
// for the hierarchical task structure to be built.

-(void)clearChildTasks
{
#warning Incomplete 
}


// Retrieves the flag indicating if this is a null task.
//
// @return boolean flag

-(Boolean)getNull
{
#warning Incomplete    
    return false;
}


// The Outline Level field contains the number that indicates the level
// of the task in the project outline hierarchy.
//
// @return int

-(int)getOutlineLevel
{
#warning Incomplete  
    return 0;
}


// The work breakdown structure code. The WBS field contains an
// alphanumeric code you can use to represent the task's position within
// the hierarchical structure of the project. This field is similar to
// the outline number, except that you can edit it.
//
// @return string

-(NSString *)getWBS
{
#warning Incomplete
    return nil;
}

// This method is used to automatically generate a value
// for the WBS field of this task.
//
// @param parent Parent Task

-(void)generateWBS:(Task *)parent
{
#warning Incomplete
}


// This method is used to automatically generate a value
// for the Outline Number field of this task.
//
// @param parent Parent Task

-(void)generateOutlineNumber:(Task *)parent
{
#warning Incomplete
}

// This method is used to associate a child task with the current
// task instance. It has package access, and has been designed to
// allow the hierarchical outline structure of tasks in an MPX
// file to be constructed as the file is read in.
//
// @param child Child task.
// @param childOutlineLevel Outline level of the child task.

-(void)addChildTask:(Task *)child with:(int)childOutlineLevel
{
#warning Incomplete
}


// This method is used to associate a child task with the current
// task instance. It has been designed to
// allow the hierarchical outline structure of tasks in an MPX
// file to be updated once all of the task data has been read.
//
// @param child child task

-(void)addChildTask:(Task *)child
{
#warning Incomplete
}

@end
