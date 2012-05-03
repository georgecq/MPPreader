//
//  VarMeta12.m
//  MppViewer
//
//  Created by Julián! on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VarMeta12.h"

@implementation VarMeta12

static int MAGIC = 0xFADFADBA;

-(id)init:(POLE::Stream *)is
{
    self = [super init];
    if(self)
    {
        _table = [[NSMutableDictionary alloc]init];
        if([self readInt:is] != MAGIC)
        {
            #warning throw exception
        }
    
        _unknown1 = [self readInt:is];
        _itemCount = [self readInt:is];
        _unknown2 = [self readInt:is];
        _unknown3 = [self readInt:is];
        _dataSize = [self readInt:is];
    
        NSString *uniqueID;
        NSString *type;
        NSString *offset;
        _offsets = [[NSMutableArray alloc]init];
        NSMutableDictionary *map;
    
        for (int loop = 0; loop < _itemCount; loop++) 
        {
            uniqueID = [NSString stringWithFormat:@"%d",[self readInt:is]];
            offset = [NSString stringWithFormat:@"%d",[self readInt:is]];
            type = [NSString stringWithFormat:@"%d",[self readShort:is]];
            [self readShort:is];
        
            map = (NSMutableDictionary *)[_table objectForKey:uniqueID];
            if(map == nil)
            {
                map = [[NSMutableDictionary alloc]init];
                [_table setValue:map forKey:uniqueID];
            }
        
            [map setValue:offset forKey:type];
            [_offsets addObject:offset];
        }
    }
    
    return self;
}

@end
