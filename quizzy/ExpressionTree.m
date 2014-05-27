//
//  ExpressionTree.m
//  quizzy
//
//  Created by Jason Chu on 5/27/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import "ExpressionTree.h"

@implementation ExpressionTree

- (id)initWithType:(ExpressionType)expressionType value:(NSInteger)value
{
    self = [super init];
    if (self) {
        self.expressionType = expressionType;
        self.value = value;
    }
    return self;
}

- (NSInteger)calculateTotal {
    if (self.expressionType == Number) {
        return self.value;
    } else if (self.expressionType == Multiply) {
        return [self.leftExpression calculateTotal] * [self.rightExpression calculateTotal];
    } else if (self.expressionType == Divide) {
        return [self.leftExpression calculateTotal] / [self.rightExpression calculateTotal];
    } else if (self.expressionType == Add) {
        return [self.leftExpression calculateTotal] + [self.rightExpression calculateTotal];
    } else if (self.expressionType == Subtract) {
        return [self.leftExpression calculateTotal] - [self.rightExpression calculateTotal];
    }
    return nil;
}

@end
