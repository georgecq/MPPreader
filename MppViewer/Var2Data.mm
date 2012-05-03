//
//  Var2Data.m
//  MppViewer
//
//  Created by Julián! on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Var2Data.h"
#import "VarMeta.h"
#import "MPPUtility.h"

@implementation Var2Data

-(id)init:(id<VarMeta>)meta withStream:(POLE::Stream *)is
{
    self = [super init];
    if(self)
    {
        _map = [[NSMutableDictionary alloc]init];
        
        _meta = meta;
        
        int itemCount = [_meta getItemCount];
        int itemOffSet;
        
        POLE::Stream *reset =  is;
        for (int loop = 0; loop < itemCount; loop++) 
        {
            itemOffSet = [[_meta getOffset:loop] intValue];
            is = reset;
            if(itemOffSet != 0)
            {
                unsigned char *buffer = new unsigned char[itemOffSet];
                is->read(buffer, sizeof(itemOffSet));
            }
            
            int size = [self readInt:is];
            
            unsigned char *data = [self readByteArray:is withSize:size];
            NSData *dataObject = [NSData dataWithBytes:data length:size];
            NSString *num = [NSString stringWithFormat:@"%d", itemOffSet];
            [_map setValue:dataObject forKey:num];
        }
    }
    
    return self;
}

-(unsigned char *)getByteArray:(NSNumber *)type
{
    unsigned char *buffer = NULL;
    NSString *typeString = [NSString stringWithFormat:@"%d", [type intValue]];
    NSData *data = [_map objectForKey:typeString];
    if(data != nil)
    {
        buffer = new unsigned char[[data length]];
        [data getBytes:buffer length:[data length]];
    }
    return buffer;
}

-(unsigned char *)getByteArray:(NSNumber *)identifier withType:(NSNumber *)type
{
    return [self getByteArray:[_meta getOffset:identifier withType:type]];
}

-(NSString *)getUnicodeString:(NSNumber *)type
{
    NSString *result = nil;
    NSString *typeString = [NSString stringWithFormat:@"%d", [type intValue]];
    NSData *item = [_map objectForKey:typeString];
    if(item != nil)
    {
        unsigned char *buffer = new unsigned char[[item length]];
        [item getBytes:buffer length:[item length]];
        result = [MPPUtility getUnicodeString:buffer withSize:[item length]];
    }
    
    return result;
}

-(NSString *)getUnicodeString:(NSNumber *)identifier withType:(NSNumber *)type
{
    return [self getUnicodeString:[_meta getOffset:identifier withType:type]];
}

#warning Incomplete

@end
