//
// AccrueType.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NumberUtility.h"
#import "MpxjEnum.h"

@interface AccrueType : NSObject <MpxjEnum>
{
  int _value;
}

+(AccrueType *)getInstance:(int)type;

+(AccrueType *)getInstanceWithNumber:(NSNumber *)type;

+(AccrueType *)START;
+(AccrueType *)END;
+(AccrueType *)PRORATED;

@end
