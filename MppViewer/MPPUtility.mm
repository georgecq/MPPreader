//
//  MPPUtility.m
//  MppViewer
//
//  Created by Julián! on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MPPUtility.h"

@implementation MPPUtility

+(int)getInt:(unsigned char[])data withOffSet:(int)offSet
{
    int result = 0;
    int i = offSet;
    for(int shiftBy = 0; shiftBy < 32; shiftBy += 8)
    {
        result |= ((data[i] & 0xff)) << shiftBy;
        ++i;
    }
    
    return result;
}

+(int)getInt:(unsigned char[])data
{
    return [self getInt:data withOffSet:0];
}

@end
