//
//  DateUtility.m
//  MppViewer
//
//  Created by Julián! on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DateUtility.h"
#import "ProjectCalendar.h"
#import "Task.h"
#import "TimeUnit.h"
#import "MPPDuration.h"
#import "ProjectFile.h"

@implementation DateUtility

+(MPPDuration *)getVariance:(Task *)task withDate1:(NSDate *)date1 withDate2:(NSDate *)date2 withFormat:(TimeUnit *)format
{
    MPPDuration *variance = nil;
    if(date1 != nil && date2 != nil)
    {
        ProjectCalendar *calendar = [task getCalendar];
        if(calendar == nil)
        {
            calendar = [[task getParentFile]getCalendar];
        }
        
        if(calendar != nil)
        {
            variance = [calendar getWork:date1 withEndDate:date2 withFormat:format];
        }
    }
    
    if(variance == nil)
    {
        variance = [MPPDuration getInstance:0 withIntType:format];
    }
    
    return variance;
}

@end
