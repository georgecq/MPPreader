//
//  ConstraintType.h
//  MppViewer
//
//  Created by Fernando Araya on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConstraintType : NSObject
{
    int _value;
}

+(ConstraintType *)getInstance:(int)type;

-(int)getValue;

+(ConstraintType *)AS_SOON_AS_POSSIBLE;
+(ConstraintType *)AS_LATE_AS_POSSIBLE;
+(ConstraintType *)MUST_START_ON;
+(ConstraintType *)MUST_FINISH_ON;
+(ConstraintType *)START_NO_EARLIER_THAN;
+(ConstraintType *)START_NO_LATER_THAN;
+(ConstraintType *)FINISH_NO_EARLIER_THAN;
+(ConstraintType *)FINISH_NO_LATER_THAN;

@end
