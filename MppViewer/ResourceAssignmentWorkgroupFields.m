//
//  ResourceAssignmentWorkgroupFields.m
//  MppViewer
//
//  Created by emilio1 on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ResourceAssignmentWorkgroupFields.h"

@implementation ResourceAssignmentWorkgroupFields

static ResourceAssignmentWorkgroupFields *_EMPTY =nil;

@synthesize MessageUniqueID;
@synthesize Confirmed;
@synthesize ResponsePending;
@synthesize UpdateStart;
@synthesize UpdateFinish;
@synthesize ScheduleID;

+(ResourceAssignmentWorkgroupFields *)EMPTY
{
    if(_EMPTY == nil)
    {
        _EMPTY = [[ResourceAssignmentWorkgroupFields  alloc] init];
    }
    
    return _EMPTY;
}

@end
