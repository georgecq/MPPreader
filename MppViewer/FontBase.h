//
//  FontBase.h
//  MppViewer
//
//  Created by Julián! on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FontBase : NSObject
{
    NSNumber *_index;
    NSString *_name;
    int _size;
}

-(id)init:(NSNumber *)index withName:(NSString *)name withSize:(int)size;

-(NSString *)getName;

-(int)getSize;

-(NSNumber *)getIndex;

-(NSString *)toString;

@end
