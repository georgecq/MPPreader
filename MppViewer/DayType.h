//
//  DayType.h
//  mppParser
//
//  Created by George on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface DayType : NSObject <MpxjEnum>
{
    int _value;
}

+(DayType *)getInstance:(int)type;

+(DayType *)getInstanceWithNumber:(NSNumber *)type;

+(DayType *)NON_WORKING;
+(DayType *)WORKING;
+(DayType *)DEFAULT;

@end
