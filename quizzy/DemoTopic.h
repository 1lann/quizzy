//
//  DemoTopic.h
//  quizzy
//
//  Created by Jason Chu on 5/3/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface DemoTopic : NSObject

@property NSString* name;
@property NSString* description;
- (Question*)generateQuestionWithLevel:(NSInteger)level previousQuestions:(NSArray*)previousQuestions;

@end
