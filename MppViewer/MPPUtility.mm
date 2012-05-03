//
//  MPPUtility.m
//  MppViewer
//
//  Created by Julián! on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MPPUtility.h"
#import <string>

@implementation MPPUtility

+(int)getInt:(unsigned char[])data
{
    return [self getInt:data withOffSet:0];
}

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

+(int)getShort:(unsigned char[])data
{
    return [self getShort:data withOffSet:0];
}

+(int)getShort:(unsigned char[])data withOffSet:(int)offSet
{
    int result = 0;
    int i = offSet;
    for(int shiftBy = 0; shiftBy < 16; shiftBy += 8)
    {
        result |= ((data[i] & 0xff)) << shiftBy;
        ++i;
    }
    
    return result;
}

+(NSString *)getUnicodeString:(unsigned char[])data withSize:(int)size
{
    return [self getUnicodeString:data withSize:size withOffSet:0];
}

+(NSString *)getUnicodeString:(unsigned char[])data withSize:(int)size withOffSet:(int)offSet
{
    NSString *buffer = [[NSString alloc]init];
    char c;
    for(int loop = offSet; loop < size - 1; loop += 2)
    {
        c = (char)[self getShort:data withOffSet:loop];
        if(c == 0)
        {
            break;
        }
        
        buffer = [buffer stringByAppendingFormat:@"%c", c];
    }
    
    return buffer;
}

@end
