//
//  AbstractVarMeta.m
//  MppViewer
//
//  Created by Julián! on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AbstractVarMeta.h"
#import "FieldMap.h"

@implementation AbstractVarMeta

-(int)getItemCount
{
    return _itemCount;
}

-(int)getDataSize
{
    return _dataSize;
}

-(NSMutableArray *)getUniqueIdentifierArray
{
    NSArray *keys = [_table allKeys];
    NSMutableArray *result = [[NSMutableArray alloc]initWithArray:keys];
    return result;
}

-(NSMutableArray *)getUniqueIdentifierSet
{
    NSArray *keys = [_table allKeys];
    NSMutableArray *result = [[NSMutableArray alloc]initWithArray:keys];
    return result;
}

-(NSNumber *)getOffset:(NSNumber *)identifier withType:(NSNumber *)type
{
    NSNumber *result = nil;
    NSString *identifierKey = [NSString stringWithFormat:@"%d", [identifier intValue]];
    NSMutableDictionary *map = [_table objectForKey:identifierKey];
    if(map != nil && type != nil)
    {
        NSString *typeString = [NSString stringWithFormat:@"%d", [type intValue]];
        result = (NSNumber *)[map objectForKey:typeString];
    }
    
    return result;
}

-(NSNumber *)getOffset:(int)index
{
    return [_offsets objectAtIndex:index];
}

-(NSMutableArray *)getTypes:(NSNumber *)identifier
{
    NSMutableArray *result = nil;
    NSString *identifierKey = [NSString stringWithFormat:@"%d", [identifier intValue]];
    NSMutableDictionary *map = [_table objectForKey:identifierKey];
    if(map != nil)
    {
        result = [[NSMutableArray alloc]initWithArray:[map allKeys]];
    }
    else
    {
        result = [[NSMutableArray alloc]init];
    }
    
    return  result;
}

-(Boolean)containsKey:(NSNumber *)key
{
    NSString *identifierKey = [NSString stringWithFormat:@"%d", [key intValue]];
    if([_table objectForKey:identifierKey])
    {
        return true;
    }

    return false;
}

-(NSString *)toString
{
    return [self toString:nil];
}

-(NSString *)toString:(FieldMap *)fieldMap
{
    #warning Incomplete
}

@end
