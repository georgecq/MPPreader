//
//  ResourceAssignment.h
//  mppParser
//
//  Created by George on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Task;
@class Resource;
@class ProjectFile;

@interface ResourceAssignment : NSObject

// Gets or Sets the task UniqueId.
@property (readwrite, assign) int UniqueID;

-(id)init:(ProjectFile *)file with:(Task *)task;

-(Task*) getTask;

-(Resource*)getResource;

-(int)getResourceUniqueID;

@end
