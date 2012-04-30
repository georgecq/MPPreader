//
//  EnumUtility.m
//  MppViewer
//
//  Created by Fernando Araya on 4/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EnumUtility.h"

@implementation EnumUtility

+(NSMutableArray *)createTypeArray:(NSMutableArray *)originalArray withOffSet:(int)arraySizeOffset
{
    NSMutableArray * result = [[NSMutableArray alloc]init];
    int count = [originalArray count] + arraySizeOffset;
    
    int j = 0;
    for (int i=0; i<count; i++) 
    {
        id<MpxjEnum> obj = [originalArray objectAtIndex:j];
        if([obj getValue] == i)
        {
            [result addObject:obj];
            j++;
        }
        else
        {
            [result addObject:[NSNull null]];
        }
    }
    
    return result;
}

@end
