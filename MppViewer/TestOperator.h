//
//  TestOperator.h
//  MppViewer
//
//  Created by Julián! on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface TestOperator : NSObject <MpxjEnum>
{
    int _value;
}

+(TestOperator *)getInstance:(int)type;

-(int)getValue;

-(Boolean)evaluate:(NSObject *)lhs otherObject:(NSObject *)rhs;

-(Boolean)evaluateWithin:(NSObject *)lhs otherObject:(NSObject *)rhs;

-(int)evaluateCompareTo:(NSObject *)lhs otherObject:(NSObject *)rhs;

-(Boolean)evaluateContains:(NSObject *)lhs otherObject:(NSObject *)rhs;

-(Boolean)evaluateContainsExactly:(NSObject *)lhs otherObject:(NSObject *)rhs;

+(TestOperator *)IS_ANY_VALUE;
+(TestOperator *)IS_WITHIN;
+(TestOperator *)IS_GREATER_THAN;
+(TestOperator *)IS_LESS_THAN;
+(TestOperator *)IS_GREATER_THAN_OR_EQUAL_TO;
+(TestOperator *)IS_LESS_THAN_OR_EQUAL_TO;
+(TestOperator *)EQUALS;
+(TestOperator *)DOES_NOT_EQUAL;
+(TestOperator *)CONTAINS;
+(TestOperator *)IS_NOT_WITHIN;
+(TestOperator *)DOES_NOT_CONTAIN;
+(TestOperator *)CONTAINS_EXACTLY;
+(TestOperator *)AND;
+(TestOperator *)OR;

@end
