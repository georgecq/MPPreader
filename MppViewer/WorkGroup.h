//
// WorkGroup.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface WorkGroup : NSObject <MpxjEnum>
{
    int _value;
}

+(WorkGroup *)getInstance:(int)type;

+(WorkGroup *)getInstanceWithNumber:(NSNumber *)type;

+(WorkGroup *)DEFAULT;
+(WorkGroup *)NONE;
+(WorkGroup *)EMAIL;
+(WorkGroup *)WEB;

@end
