//
//  VarMeta.h
//  MppViewer
//
//  Created by Julián! on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FieldMap;

@protocol VarMeta <NSObject>

-(int)getItemCount;

-(int)getDataSize;

-(NSMutableArray *)getUniqueIdentifierArray;

-(NSMutableArray *)getUniqueIdentifierSet;

-(NSNumber *)getOffset:(NSNumber *)identifier withType:(NSNumber *)type;

-(NSNumber *)getOffset:(int)index;

-(NSMutableArray *)getTypes:(NSNumber *)identifier;

-(Boolean)containsKey:(NSNumber *)key;

-(NSString *)toString:(FieldMap *)fieldMap;

@end
