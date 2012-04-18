//
//  TaskType.h
//  MppViewer
//
//  Created by Fernando Araya on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskType : NSObject
{
    int _value;
}

+(TaskType *)getInstance:(int)type;

+(TaskType *)getInstanceWithNumber:(NSNumber *)type;

-(int)getValue;

+(TaskType *)FIXED_UNITS;
+(TaskType *)FIXED_DURATION;
+(TaskType *)FIXED_WORK;

@end
