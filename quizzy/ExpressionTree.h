//
//  ExpressionTree.h
//  quizzy
//
//  Created by Jason Chu on 5/27/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExpressionTree : NSObject

@property ExpressionTree* leftExpression;
@property ExpressionTree* rightExpression;

typedef NS_ENUM(NSInteger, ExpressionType) {
    Multiply,
    Add,
    Subtract,
    Number
};

@property int value;
@property ExpressionType expressionType;

- (NSInteger)calculateTotal;
- (id)initWithType:(ExpressionType)expressionType value:(NSInteger)value;

@end
