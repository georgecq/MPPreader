//
//  Priority.h
//  MppViewer
//
//  Created by emilio1 on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Priority : NSObject
{
    int _value;
}

+(Priority *)getInstance:(int)priority;

-(int)getValue;

+(int)LOWEST;
+(int)VERY_LOW;
+(int)LOWER;
+(int)LOW;
+(int)MEDIUM;
+(int)HIGH;
+(int)HIGHER;
+(int)VERY_HIGH;
+(int)HIGHEST;
+(int)DO_NOT_LEVEL;

@end
