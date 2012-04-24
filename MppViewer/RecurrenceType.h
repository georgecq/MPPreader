//
//  RecurrenceType.h
//  MppViewer
//
//  Created by Fernando Araya on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface RecurrenceType : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

+(RecurrenceType *)getInstance:(int)type;

-(NSString *)toString;

+(RecurrenceType *)DAILY;
+(RecurrenceType *)WEEKLY;
+(RecurrenceType *)MONTHLY;
+(RecurrenceType *)YEARLY;

+(NSMutableArray *)TYPE_VALUES;

@end
