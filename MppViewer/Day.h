//
//  Day.h
//  mppParser
//
//  Created by George on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Day : NSObject
{
    int _value;
}

-(id)init:(int)value;

-(int)getValue;

-(Day *)getNextDay;

+(Day *)getInstance:(int) value;

-(NSString *)toString;

+(Day *)SUNDAY;
+(Day *)MONDAY;
+(Day *)TUESDAY;
+(Day *)WEDNESDAY;
+(Day *)THURSDAY;
+(Day *)FRIDAY;
+(Day *)SATURDAY;


@end
