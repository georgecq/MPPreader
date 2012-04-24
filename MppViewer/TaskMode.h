//
//  TaskMode.h
//  MppViewer
//
//  Created by Fernando Araya on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface TaskMode : NSObject <MpxjEnum>
{
    int _value;
}

+(TaskMode *)getInstance:(int)type;

+(TaskMode *)getInstanceWithNumber:(NSNumber *)type;

+(TaskMode *)MANUALLY_SCHEDULED;
+(TaskMode *)AUTO_SCHEDULED;

@end
