//
// DateOrder.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface DateOrder : NSObject <MpxjEnum>
{
    int _value;
}

+(DateOrder *)getInstance:(int)type;

+(DateOrder *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)toString;

+(DateOrder *)MDY;
+(DateOrder *)DMY;
+(DateOrder *)YMD;

@end
