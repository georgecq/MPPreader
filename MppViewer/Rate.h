//
//  Rate.h
//  MppViewer
//
//  Created by Julián! on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TimeUnit;

@interface Rate : NSObject
{
    double _amount;
    TimeUnit *_units;
}

-(id)init:(NSNumber *)number withTime:(TimeUnit *)time;

-(id)init:(double)amount withDoubleTime:(TimeUnit *)time;

-(double)getAmount;

-(TimeUnit *)getUnits;

-(Boolean)equals:(NSObject *)object;

-(NSString *)toString;

@end
