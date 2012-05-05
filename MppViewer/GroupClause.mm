//
//  GroupClause.m
//  MppViewer
//
//  Created by Julián! on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GroupClause.h"
#import "FontStyle.h"
#import "BackgroundPattern.h"

@implementation GroupClause

@synthesize field;
@synthesize ascending;
@synthesize font;
@synthesize cellBackgroundColor;
@synthesize pattern;
@synthesize groupOn;
@synthesize startAt;
@synthesize groupInterval;

/**
 * {@inheritDoc}
 */

-(NSString *)toString
{
    return [NSString stringWithFormat:@"[GroupClause field=%@ ascending=%d font=%@ color=%@ pattern=%@ groupOn=%d startAt=%@ groupInterval=%@]", [self field], [self ascending], [[self font] toString], [self cellBackgroundColor], [self pattern], [[self pattern]toString], [self groupOn], [self startAt], [self groupInterval]];
}

@end
