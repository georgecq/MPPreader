//
//  DataType.h
//  MppViewer
//
//  Created by Fernando Araya on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataType : NSObject
{ 
    int _value;
}

-(id)init:(int)type;

+(DataType *)getInstance:(int)type;

-(int)getValue;

+(DataType *)STRING;
+(DataType *)DATE;
+(DataType *)CURRENCY;
+(DataType *)BOOLEAN;
+(DataType *)NUMERIC;
+(DataType *)DURATION;
+(DataType *)UNITS;
+(DataType *)PERCENTAGE;
+(DataType *)ACCRUE;
+(DataType *)CONSTRAINT;
+(DataType *)RATE;
+(DataType *)PRIORITY;
+(DataType *)RELATION_LIST;
+(DataType *)TASK_TYPE;
+(DataType *)RESOURCE_TYPE;
+(DataType *)TIME_UNITS;
+(DataType *)WORK;
+(DataType *)INTEGER;
+(DataType *)ASCII_STRING;
+(DataType *)SHORT;
+(DataType *)BINARY;
+(DataType *)DELAY;
+(DataType *)WORK_UNITS;
+(DataType *)WORKGROUP;
+(DataType *)GUID;
+(DataType *)RATE_UNITS;

@end
