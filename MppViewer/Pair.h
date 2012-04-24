//
//  Pair.h
//  MppViewer
//
//  Created by emilio1 on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pair : NSObject
{
    id _first;
    id _second;
}

-(id)init:(id)first withSecond:(id)second;

-(id)getFirst;

-(id)getSecond;

@end
