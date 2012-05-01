//
//  AbstractVarMeta.h
//  MppViewer
//
//  Created by Julián! on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MPPComponent.h"
#import "VarMeta.h"

@interface AbstractVarMeta : MPPComponent <VarMeta>
{
    int _unknown1;
    int _itemCount;
    int _unknown2;
    int _unknown3;
    int _dataSize;
    NSMutableArray *_offsets;
    NSMutableDictionary *_table;
}

-(NSString *)toString;

@end
