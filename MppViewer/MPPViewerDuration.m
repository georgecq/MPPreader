//
//  MPPViewerDuration.m
//  MppViewer
//
//  Created by Fernando Araya on 4/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MPPViewerDuration.h"
#import "ProjectHeader.h"
#import "TimeUnit.h"

@implementation MPPViewerDuration

static NSMutableArray *_ZERO_DURATIONS = nil;

/**
 * Constructs an instance of this class from a duration amount and
 * time unit type.
 *
 * @param duration amount of duration
 * @param type time unit of duration
 */

-(id)init:(double)duration withDoubleType:(TimeUnit *) type
{
    self= [super init];
    if (self)
    {
        _duration = duration;
        _units = type;
    }
    
    return self;
}

/**
 * Constructs an instance of this class from a duration amount and
 * time unit type.
 *
 * @param duration amount of duration
 * @param type time unit of duration
 */

-(id)init:(int)duration withIntType:(TimeUnit *) type
{
    self= [super init];
    if (self)
    {
        _duration = duration;
        _units = type;
    }
    
    return self;
}

/**
 * This method is used to retrieve the size of the duration.
 *
 * @return size of the duration
 */

-(double)getDuration
{
    return _duration;
}

/**
 * This method is used to retrieve the type of units the duration
 * is expressed in. The valid types of units are found in the TimeUnit
 * class.
 *
 * @return type of units
 */

-(TimeUnit *) getUnits
{
    return _units;
}

/**
 * This method provides an <i>approximate</i> conversion between duration
 * units. It does take into account the project defaults for number of hours
 * in a day and a week, but it does not take account of calendar details.
 * The results obtained from it should therefore be treated with caution.
 *
 * @param type target duration type
 * @param defaults project header containing default values
 * @return new Duration instance
 */

-(MPPViewerDuration *) convertUnits:(TimeUnit *)type withDefaults: (ProjectHeader *) defaults
{
    return [MPPViewerDuration convertUnits:_duration withFromUnits:_units withToUnits:type withDefaults: defaults];
}

/**
 * This method provides an <i>approximate</i> conversion between duration
 * units. It does take into account the project defaults for number of hours
 * in a day and a week, but it does not take account of calendar details.
 * The results obtained from it should therefore be treated with caution.
 * 
 * @param duration duration value
 * @param fromUnits units to convert from
 * @param toUnits units to convert to
 * @param defaults project header containing default values
 * @return new Duration instance
 */

+(MPPViewerDuration *) convertUnits:(double) duration  withFromUnits:(TimeUnit *) fromUnits withToUnits: (TimeUnit *) toUnits withDefaults:(ProjectHeader *) defaults
{
    return [MPPViewerDuration convertUnits:duration  withFromUnits:fromUnits withToUnits:toUnits withMinutesPerDay:[defaults getMinutesPerDay] withMinutesPerWeek:[defaults getMinutesPerWeek] withDaysPerWeek:[defaults getDaysPerMonth]];
}

/**
 * This method provides an <i>approximate</i> conversion between duration
 * units. It does take into account the project defaults for number of hours
 * in a day and a week, but it does not take account of calendar details.
 * The results obtained from it should therefore be treated with caution.
 *
 * @param duration duration value
 * @param fromUnits units to convert from
 * @param toUnits units to convert to
 * @param minutesPerDay number of minutes per day
 * @param minutesPerWeek number of minutes per week
 * @param daysPerMonth number of days per month
 * @return new Duration instance
 */

+(MPPViewerDuration *) convertUnits:(double) duration withFromUnits: (TimeUnit *) fromUnits withToUnits:(TimeUnit *) toUnits  withMinutesPerDay:(double) minutesPerDay withMinutesPerWeek:(double) minutesPerWeek withDaysPerWeek:(double) daysPerMonth
{
    if(fromUnits == [TimeUnit YEARS])
    {
        duration *= (minutesPerWeek * 52);
    }
    
    if(fromUnits == [TimeUnit ELAPSED_YEARS])
    {
        duration *= (60 * 24 * 7 * 52);
    }
    
    if(fromUnits == [TimeUnit MONTHS])
    {
        duration *= (minutesPerDay * daysPerMonth);
    }
    
    if(fromUnits == [TimeUnit ELAPSED_MONTHS])
    {
        duration *= (60 * 24 * 30);
    }
    
    if(fromUnits == [TimeUnit WEEKS])
    {
        duration *= minutesPerWeek;
    }
    
    if(fromUnits == [TimeUnit ELAPSED_WEEKS])
    {
        duration *= (60 * 24 * 7);
    }
    
    if(fromUnits == [TimeUnit DAYS])
    {
        duration *= minutesPerDay;
    }
    
    if(fromUnits == [TimeUnit ELAPSED_DAYS])
    {
        duration *= (60 * 24);
    }
    
    if(fromUnits == [TimeUnit HOURS] || fromUnits == [TimeUnit ELAPSED_HOURS])
    {
        duration *= 60;
    }
    
    if (toUnits != [TimeUnit MINUTES] && toUnits != [TimeUnit ELAPSED_MINUTES])
    {
        if(toUnits == [TimeUnit HOURS] || toUnits == [TimeUnit ELAPSED_HOURS])
        {
            duration /= 60;
        }
          
        if(toUnits == [TimeUnit DAYS])
        {
            if (minutesPerDay != 0)
            {
                duration /= minutesPerDay;
            }
            else
            {
                duration = 0;
            }
        }
          
        if(toUnits == [TimeUnit ELAPSED_DAYS])
        {
            duration /= (60 * 24);
        }
          
        if(toUnits == [TimeUnit WEEKS])
        {
            if (minutesPerWeek != 0)
            {
                duration /= minutesPerWeek;
            }
            else
            {
                duration = 0;
            }
        }
       
        if(toUnits == [TimeUnit ELAPSED_WEEKS])
        {
            duration /= (60 * 24 * 7);
        }
       
        if(toUnits == [TimeUnit MONTHS])
        {
            if (minutesPerDay != 0 && daysPerMonth != 0)
            {
                duration /= (minutesPerDay * daysPerMonth);
            }
            else
            {
                duration = 0;
            }
        }
        
        if(toUnits == [TimeUnit ELAPSED_MONTHS])
        {
            duration /= (60 * 24 * 30);
        }         

        if(toUnits == [TimeUnit YEARS])
        {
            if (minutesPerWeek != 0)
            {
                duration /= (minutesPerWeek * 52);
            }
            else
            {
                duration = 0;
            }
        }        
        
        if(toUnits == [TimeUnit ELAPSED_YEARS])
        {
            duration /= (60 * 24 * 7 * 52);
        }        
    }
    
    return [MPPViewerDuration getInstance:duration withDoubleType:toUnits];
}
   
/**
 * Retrieve an Duration instance. Use shared objects to
 * represent common values for memory efficiency.
 *
 * @param duration duration value
 * @param type duration type
 * @return Duration instance
 */

+(MPPViewerDuration *) getInstance:(double) duration withDoubleType:(TimeUnit *) type
{
    MPPViewerDuration *result;
    if (duration == 0)
    {
        result = [[MPPViewerDuration ZERO_DURATIONS] objectAtIndex: [type getValue]];
    }
    else
    {
        result = [[MPPViewerDuration alloc] init:duration withDoubleType: type];
    }
    
    return (result);
}

/**
 * Retrieve an Duration instance. Use shared objects to
 * represent common values for memory efficiency.
 *
 * @param duration duration value
 * @param type duration type
 * @return Duration instance
 */

+(MPPViewerDuration *) getInstance:(int) duration withIntType:(TimeUnit *) type
{
    MPPViewerDuration *result;
    if (duration == 0)
    {
        result = [[MPPViewerDuration ZERO_DURATIONS] objectAtIndex: [type getValue]];
    }
    else
    {
        result = [[MPPViewerDuration alloc] init:duration withDoubleType: type];
    }
    
    return (result);
}

/**
 * {@inheritDoc}
 */

-(BOOL)isEqual:(id)otherObject
{    
    if([otherObject isKindOfClass:[self class]])
    {
        if([self getDuration] == [otherObject getDuration] && [self getUnits] == [otherObject getUnits])  
        {
            return YES;
        }
    }
        
    return NO;
}

/**
 * {@inheritDoc}
 */

-(int) hashCode
{
    return [_units getValue] + (int)_duration;
}

/**
 * {@inheritDoc}
 */

-(int) compareTo:(MPPViewerDuration *) rhs;
{    
    if (_units != [rhs getUnits])
    {
        rhs = [MPPViewerDuration convertUnits:[rhs getDuration] withFromUnits:[rhs getUnits] withToUnits:_units  withMinutesPerDay:(8 * 60) withMinutesPerWeek:(5 * 8 * 60)  withDaysPerWeek:20];
    }
    
    return (_duration < [rhs getDuration]) ? -1 : (_duration == [rhs getDuration]) ? 0 : 1;
}

/**
 * {@inheritDoc}
 */

-(NSString *) toString
{
    NSString * result = [NSString stringWithFormat:@"%f %@", _duration, [_units toString]];
    
    return result;
}

+(NSMutableArray *)ZERO_DURATIONS
{
    if (_ZERO_DURATIONS == nil) 
    {
        _ZERO_DURATIONS = [[NSMutableArray alloc]initWithObjects:[[MPPViewerDuration alloc] init:0 withDoubleType:[TimeUnit MINUTES]],[[MPPViewerDuration alloc] init:0 withDoubleType:[TimeUnit HOURS]], [[MPPViewerDuration alloc] init:0 withDoubleType:[TimeUnit DAYS]], [[MPPViewerDuration alloc] init:0 withDoubleType:[TimeUnit WEEKS]], [[MPPViewerDuration alloc] init:0 withDoubleType:[TimeUnit MONTHS]], [[MPPViewerDuration alloc] init:0 withDoubleType:[TimeUnit MINUTES]], [[MPPViewerDuration alloc] init:0 withDoubleType:[TimeUnit YEARS]], [[MPPViewerDuration alloc] init:0 withDoubleType:[TimeUnit PERCENT]], [[MPPViewerDuration alloc] init:0 withDoubleType:[TimeUnit ELAPSED_MINUTES]], [[MPPViewerDuration alloc] init:0 withDoubleType:[TimeUnit ELAPSED_HOURS]], [[MPPViewerDuration alloc] init:0 withDoubleType:[TimeUnit ELAPSED_DAYS]], [[MPPViewerDuration alloc] init:0 withDoubleType:[TimeUnit ELAPSED_WEEKS]], [[MPPViewerDuration alloc] init:0 withDoubleType:[TimeUnit ELAPSED_MONTHS]], [[MPPViewerDuration alloc] init:0 withDoubleType:[TimeUnit ELAPSED_YEARS]], [[MPPViewerDuration alloc] init:0 withDoubleType:[TimeUnit ELAPSED_PERCENT]], nil];
    }
    
    return _ZERO_DURATIONS; 
}

@end
