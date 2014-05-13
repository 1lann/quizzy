//
//  DoubleDigitsAddition.m
//  quizzy
//
//  Created by Jason Chu on 5/13/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import "SimpleAddition.h"

@implementation SimpleAddition

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Simple Addition";
		self.description = @"Test how good you are at adding numbers!";
    }
    return self;
}

- (Question *)generateQuestionWithLevel:(NSInteger)level previousQuestions:(NSArray *)previousQuestions {
	Question* question = [[Question alloc] init];
	int firstNumber = arc4random() % 50;
    int secondNumber = arc4random() % 50;
	question.question = [NSString stringWithFormat:@"%i+%i=", firstNumber, secondNumber];
	
    int answer = firstNumber+secondNumber;
	NSMutableArray* answers = [[NSMutableArray alloc] init];
	
	int randomIndex = arc4random() % (question.maxAnswers-1);
	for (int index = 0; index < question.maxAnswers; index++) {
		if (index == randomIndex) {
            question.correctAnswerIndex = answers.count;
			[answers addObject:[NSString stringWithFormat:@"%i", answer]];
		} else {
            int randomNumber = 0;
            while (YES) {
                randomNumber = (arc4random() % 100);
                if (![answers containsObject:[NSString stringWithFormat:@"%i", randomNumber]] && randomNumber != answer && randomNumber > firstNumber && randomNumber > secondNumber) {
                    break;
                }
            }
            [answers addObject:[NSString stringWithFormat:@"%i", randomNumber]];
        }
	}
    question.answers = [answers copy];
    
	return question;
}

@end
