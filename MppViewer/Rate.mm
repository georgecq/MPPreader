//
//  Rate.m
//  MppViewer
//
//  Created by Julián! on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Rate.h"
#import "TimeUnit.h"

@implementation Rate

-(id)init:(NSNumber *)number withTime:(TimeUnit *)time
{
    self = [super init];
    if (self)
    {
        if (number == nil) 
        {
            _amount = 0;
        } 
        else
        {
            _amount = [number doubleValue];
        }
        
        _units = time;
    }
    return self;
}

-(id)init:(double)amount withDoubleTime:(TimeUnit *)time
{
    self = [super init];
    if (self)
    {
        _amount = amount;
        _units = time;
    }
    return self;
}

-(double)getAmount
{
    return _amount;
}

-(TimeUnit *)getUnits
{
    return _units;
}

-(Boolean)equals:(NSObject *)object
{
    Boolean result = false;
    if([object isKindOfClass:[Rate class]])
    {
        Rate *rhs = (Rate *)object;
        result = _amount == [rhs getAmount] && _units == [rhs getUnits];
    }
    return result;
}

-(NSString *)toString
{
    return [NSString stringWithFormat:@"%f%@", _amount, [_units toString]];
}

@end
