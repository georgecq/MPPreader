//
//  Resource.h
//  mppParser
//
//  Created by George on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ResourceAssignment;
@class ProjectCalendar;
@class ProjectFile;

@interface Resource : NSObject

// Gets or Sets the resource Id.
@property (readwrite, assign) int ID;

// Gets or Sets the resource Unique Id.
@property (readwrite, assign) int UniqueID;

-(id)init:(ProjectFile *)file;

-(void)removeResourceAssignment:(ResourceAssignment *)assignment;

-(void)setResourceCalendar:(ProjectCalendar *)calendar;

-(int)getUniqueID;

-(int)getID;

-(ProjectCalendar *)getResourceCalendar;

@end
