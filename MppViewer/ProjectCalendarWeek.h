//
//  ProjectCalendarWeek.h
//  mppParser
//
//  Created by George on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Day;
@class DayType;

@interface ProjectCalendarWeek : NSObject


// Gets or Sets the resource Unique Id.
@property (nonatomic, strong) NSString * Name;

-(void)setWorkingDay:(Day *)day   AsWorking:(Boolean)working;

-(void)setWorkingDay:(Day *)day  withType:(DayType *)workingType;

-(void)addDefaultCalendarHours;

@end
