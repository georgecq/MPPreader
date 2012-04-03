//
//  DayType.h
//  mppParser
//
//  Created by George on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DayType : NSObject
{
    int _value;
}

-(id)init:(int)type;

+(DayType *)getInstance:(int)type;

-(int)getValue;

+(DayType *)NON_WORKING;

+(DayType *)WORKING;

+(DayType *)DEFAULT;


@end
