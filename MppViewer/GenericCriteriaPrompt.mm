//
//  GenericCriteriaPrompt.m
//  MppViewer
//
//  Created by Julián! on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GenericCriteriaPrompt.h"
#import "DataType.h"

@implementation GenericCriteriaPrompt

-(id)init:(DataType *)type withPrompt:(NSString *)prompt
{
    self = [super init];
    if (self) 
    {
        _dataType = type;
        _prompt = prompt;
    }
    return self;
}

-(DataType *)getType
{
    return _dataType;
}

-(NSString *)getPrompt
{
    return _prompt;
}

-(NSString *)toString
{
    return [NSString stringWithFormat:@"PROMPT(%@)", _prompt];
}

@end
