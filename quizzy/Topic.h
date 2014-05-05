//
//  Topic.h
//  quizzy
//
//  Created by Jason Chu on 5/3/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DemoTopic.h"

@interface Topic : NSObject

@property NSMutableDictionary* availableTopics;
@property NSString* name;
@property NSString* description;
- (Question*)generateQuestionWithLevel:(NSInteger)level previousQuestions:(NSArray*)previousQuestions;
- (id)initWithTopic:(NSString*)topic;

@end
