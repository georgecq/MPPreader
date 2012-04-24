//
// BookingType.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface BookingType : NSObject <MpxjEnum>
{
    int _value;
}

+(BookingType *)getInstance:(int)type;

+(BookingType *)COMMITTED;
+(BookingType *)PROPOSED;

@end
