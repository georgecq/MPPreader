//
//  TaskType.h
//  MppViewer
//
//  Created by Fernando Araya on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface TaskType : NSObject <MpxjEnum>
{
    int _value;
}

+(TaskType *)getInstance:(int)type;

+(TaskType *)getInstanceWithNumber:(NSNumber *)type;

+(TaskType *)FIXED_UNITS;
+(TaskType *)FIXED_DURATION;
+(TaskType *)FIXED_WORK;

@end
