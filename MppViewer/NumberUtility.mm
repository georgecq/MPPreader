//
//  NumberUtility.m
//  MppViewer
//
//  Created by emilio1 on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NumberUtility.h"

@implementation NumberUtility

+(int)getInt:(NSNumber *)value
{
    return value == nil ? 0 : [value intValue];
}

@end
