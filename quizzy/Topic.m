//
//  Topic.m
//  quizzy
//
//  Created by Jason Chu on 5/3/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import "Topic.h"

@interface Topic ()

@property id topic;

@end

@implementation Topic

- (id)init
{
    self = [super init];
    if (self) {
		self.availableTopics = [[NSMutableDictionary alloc] init];
        [self.availableTopics setObject:@{@"DemoTopic": @"Demo Topic",
                                          @"AnotherDemoTopic": @"Another Demo Topic"} forKey:@"Demo Topics"];
        [self.availableTopics setObject:@{@"SimpleAddition": @"Simple Addition",
                                          @"SolvingExpressions": @"Solving Expressions"} forKey:@"Mathematics"];
        [self.availableTopics setObject:@{@"Science": @"SCIENCE!"} forKey:@"Science"];
    }
    return self;
}

- (id)initWithTopic:(NSString*)topic
{
    self = [super init];
    if (self) {
        [self createTopicObject:topic];
		if (self.topic) {
			self.name = [self.topic valueForKey:@"name"];
			self.description = [self.topic valueForKey:@"description"];
		} else {
			return NULL;
		}
    }
    return self;
}

- (Question*)generateQuestionWithLevel:(NSInteger)level previousQuestions:(NSArray *)previousQuestions {
	if (self.topic) {
		return [self.topic generateQuestionWithLevel:level previousQuestions:previousQuestions];
	} else {
		return NULL;
	}
}

- (id)createTopicObject:(NSString*)topicName {
    self.topic = NULL;
    
	if ([topicName isEqualToString:@"DemoTopic"]) {
		self.topic = [[DemoTopic alloc] init];
	} else if ([topicName isEqualToString:@"SimpleAddition"]) {
        self.topic = [[SimpleAddition alloc] init];
    } else if ([topicName isEqualToString:@"SolvingExpressions"]) {
        self.topic = [[SolvingExpressions alloc] init];
    }
    
    return self.topic;
}

@end

