//
// ResourceType.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface ResourceType : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

+(ResourceType *)getInstance:(int)type;

+(ResourceType *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)toString;

+(ResourceType *)MATERIAL;
+(ResourceType *)WORK;
+(ResourceType *)COST;

@end
