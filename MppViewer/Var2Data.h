//
//  Var2Data.h
//  MppViewer
//
//  Created by Julián! on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MPPComponent.h"

@protocol VarMeta;

@interface Var2Data : MPPComponent
{
    id<VarMeta> _meta;
    NSMutableDictionary *_map;
}

-(id)init:(id<VarMeta>)meta withStream:(POLE::Stream *)is;

-(unsigned char *)getByteArray:(NSNumber *)type;

-(unsigned char *)getByteArray:(NSNumber *)identifier withType:(NSNumber *)type;

-(NSString *)getUnicodeString:(NSNumber *)type;

-(NSString *)getUnicodeString:(NSNumber *)identifier withType:(NSNumber *)type;

@end
