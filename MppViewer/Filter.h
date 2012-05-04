//
//  Filter.h
//  MppViewer
//
//  Created by Julián! on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GenericCriteria;
@protocol FieldContainer;

@interface Filter : NSObject

@property (strong, nonatomic) NSNumber *ID;

@property (strong, nonatomic) NSString *name;

@property (nonatomic) Boolean showRelatedSummaryRows;

@property (strong, nonatomic) GenericCriteria *criteria;

@property (nonatomic) Boolean isTaskFilter;

@property (nonatomic) Boolean isResourceFilter;

@property (strong, nonatomic) NSMutableArray *prompts;

-(Boolean)evaluate:(id<FieldContainer>)container withPromptValues:(NSMutableDictionary *)promptValues;

-(NSString *)toString;

@end
