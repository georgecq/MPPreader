//
//  Relation.h
//  mppParser
//
//  Created by George on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Task;
@class RelationType;
@class MPPDuration;

@interface Relation : NSObject
{
    Task *_sourceTask;
    Task *_targetTask;
    RelationType *_type;
    MPPDuration *_lag;
}

-(id)init:sourceTask withTargetTask:(Task *)targetTask withType:(RelationType *)type withLag:(MPPDuration *)lag;

-(RelationType *)getType;

-(MPPDuration *)getLag;

-(Task *)getSourceTask;

-(Task *)getTargetTask;

-(NSString *)toString;

@end
