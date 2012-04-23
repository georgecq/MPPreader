//
//  Relation.m
//  mppParser
//
//  Created by George on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Relation.h"
#import "RelationType.h"
#import "MPPViewerDuration.h"
#import "TimeUnit.h"
#import "Task.h"

@implementation Relation

/**
 * Default constructor.
 *
 * @param sourceTask source task instance
 * @param targetTask target task instance
 * @param type relation type
 * @param lag relation lag
 */

-(id)init:sourceTask withTargetTask:(Task *)targetTask withType:(RelationType *)type withLag:(MPPViewerDuration *)lag
{
    self = [super init];
    if(self)
    {
        _sourceTask = sourceTask;
        _targetTask = targetTask;
        _type =  type;
        _lag = lag;
        
        if(_type == nil)
        {
            _type = [RelationType FINISH_START];
        }
        
        if(_lag == nil)
        {
            _lag = [MPPViewerDuration getInstance:0 withIntType:[TimeUnit DAYS]];
        }
    }
    return self;
}

/**
 * Method used to retrieve the type of relationship being
 * represented.
 *
 * @return relationship type
 */

-(RelationType *)getType
{
    return _type;
}

/**
 * This method retrieves the lag duration associated
 * with this relationship.
 *
 * @return lag duration
 */

-(MPPViewerDuration *)getLag
{
    return _lag;
}

/**
 * Retrieve the source task of this relationship.
 * 
 * @return source task
 */

-(Task *)getSourceTask
{
    return _sourceTask;
}

/**
 * Retrieve the target task of this relationship.
 *
 * @return target task
 */

-(Task *)getTargetTask
{
    return _targetTask;
}

/**
 * {@inheritDoc}
 */

-(NSString *)toString
{
    NSString * string = [NSString stringWithFormat:@"[Relation %@ -> %@]", [_sourceTask toString], [_targetTask toString]];
    return string;
}

@end
