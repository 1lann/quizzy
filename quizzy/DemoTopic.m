//
//  DemoTopic.m
//  quizzy
//
//  Created by Jason Chu on 5/3/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import "DemoTopic.h"

@implementation DemoTopic

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Demo Topic";
		self.description = @"A demonstion topic to test this app";
    }
    return self;
}

- (Question *)generateQuestionWithLevel:(NSInteger)level previousQuestions:(NSArray *)previousQuestions {
    NSLog(@"Generation");
	Question* question = [[Question alloc] init];
	int answer = arc4random() % 10;
	question.question = [NSString stringWithFormat:@"Press %i.", answer];
	
	NSMutableArray* answers = [[NSMutableArray alloc] init];
	
	int randomIndex = arc4random() % (question.maxAnswers-1);
	for (int index = 0; index < question.maxAnswers; index++) {
		if (index == randomIndex) {
            question.correctAnswerIndex = answers.count;
			[answers addObject:[NSString stringWithFormat:@"%i", answer]];
		} else {
            int randomNumber = 0;
            while ((randomNumber = arc4random() % 10) == answer) {}
            [answers addObject:[NSString stringWithFormat:@"%i", randomNumber]];
        }
	}
    question.answers = [answers copy];
    
	return question;
}

@end
