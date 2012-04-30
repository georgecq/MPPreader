//
// DateOrder.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DateOrder.h"
#import "NumberUtility.h"

@implementation DateOrder

static DateOrder *_MDY = nil;
static DateOrder *_DMY = nil;
static DateOrder *_YMD = nil;
static NSMutableArray *_TYPE_VALUES = nil;

-(id)init:(int)type
{
    self = [super init];
    if(self)
    {
        _value  = type;
    }
    return self;
}

+(DateOrder *)getInstance:(int)type
{
    if(type < 0 || type >= [[DateOrder TYPE_VALUES]count])
    {
        type = [[DateOrder MDY]getValue];
    }
    return [[DateOrder TYPE_VALUES]objectAtIndex:type];
}

+(DateOrder *)getInstanceWithNumber:(NSNumber *)type
{
    int value;
    if(type == nil)
    {
        value = -1;
    }
    else
    {
        value = [NumberUtility getInt:type];
    }
    return [self getInstance:value];
}

-(int)getValue
{
    return _value;
}

-(NSString *)toString
{
    return [NSString stringWithFormat:@"%d", _value];
}

+(DateOrder *)MDY
{
  if(_MDY == nil)
  {
      _MDY = [[DateOrder alloc] init:0];
  }
  return _MDY;
}

+(DateOrder *)DMY
{
  if(_DMY == nil)
  {
      _DMY = [[DateOrder alloc] init:1];
  }
  return _DMY;
}

+(DateOrder *)YMD
{
  if(_YMD == nil)
  {
      _YMD = [[DateOrder alloc] init:2];
  }
  return _YMD;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[DateOrder MDY], [DateOrder DMY], [DateOrder YMD],  nil];
  }
  return _TYPE_VALUES;
}

@end
