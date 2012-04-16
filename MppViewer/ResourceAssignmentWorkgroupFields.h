//
//  ResourceAssignmentWorkgroupFields.h
//  MppViewer
//
//  Created by emilio1 on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResourceAssignmentWorkgroupFields : NSObject

@property (strong, nonatomic) NSString *MessageUniqueID;

@property (nonatomic) Boolean *Confirmed;

@property (nonatomic) Boolean *ResponsePending;

@property (strong, nonatomic) NSDate *UpdateStart;

@property (strong, nonatomic) NSDate *UpdateFinish;

@property (strong, nonatomic) NSString *ScheduleID;

+(ResourceAssignmentWorkgroupFields *)EMPTY;

@end
