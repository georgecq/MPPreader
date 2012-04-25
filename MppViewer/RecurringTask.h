//
//  RecurringTask.h
//  MppViewer
//
//  Created by Fernando Araya on 4/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MPPDuration;
@class RecurrenceType;
@class Day;

@interface RecurringTask : NSObject

@property (strong, nonatomic) NSDate *StartDate;

@property (strong, nonatomic) NSDate *FinishDate;

@property (strong, nonatomic) MPPDuration *Duration;

@property (nonatomic) int Ocurrences;

@property (strong, nonatomic) RecurrenceType *RecurrenceType;

@property (nonatomic) Boolean UseEndDate;

@property (nonatomic) Boolean DailyWorkDay;

@property (nonatomic) Boolean WeeklyDays;

@property (nonatomic) Boolean MonthlyRelative;

@property (nonatomic) Boolean YearlyAbsolute;

@property (nonatomic) int DailyFrecuency;

@property (nonatomic) int WeeklyFrecuency;

@property (nonatomic) int MontlyRelativeOrdinal;

@property (strong, nonatomic) Day * MontlyRelativeDay;

@property (nonatomic) int MontlyRelativeFrecuency;

@property (nonatomic) int MontlyAbsoluteDay;

@property (nonatomic) int MontlyAbsoluteFrecuency;

@property (nonatomic) int YearlyRelativeOrdinal;

@property (strong, nonatomic) Day * YearlyRelativeDay;

@property (nonatomic) int YearlyRelativeMonth;

@property (strong, nonatomic) NSDate *YearlyAbsoluteDate;

-(NSString *) toString;

@end
