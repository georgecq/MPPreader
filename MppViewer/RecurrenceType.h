//
//  RecurrenceType.h
//  MppViewer
//
//  Created by Fernando Araya on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecurrenceType : NSObject
{
    int _value;
    NSString *_name;
}

+(RecurrenceType *)getInstance:(int)type;

-(int)getValue;

-(NSString *)toString;

+(RecurrenceType *)DAILY;
+(RecurrenceType *)WEEKLY;
+(RecurrenceType *)MONTHLY;
+(RecurrenceType *)YEARLY;

@end
