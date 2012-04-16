//
//  TaskMode.h
//  MppViewer
//
//  Created by Fernando Araya on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskMode : NSObject
{
    int _value;
}

+(TaskMode *)getInstance:(int)type;

-(int)getValue;

+(TaskMode *)MANUALLY_SCHEDULED;
+(TaskMode *)AUTO_SCHEDULED;

@end
