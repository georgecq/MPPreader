//
//  DateUtility.h
//  MppViewer
//
//  Created by Julián! on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MPPDuration;
@class Task;
@class TimeUnit;

@interface DateUtility : NSObject

+(MPPDuration *)getVariance:(Task *)task withDate1:(NSDate *)date1 withDate2:(NSDate *)date2 withFormat:(TimeUnit *)format;

@end
