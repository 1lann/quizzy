//
//  Question.h
//  quizzy
//
//  Created by Jason Chu on 5/3/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (readonly) NSInteger maxAnswers;
@property NSString* question;
@property NSArray* answers;
@property NSInteger correctAnswerIndex;

@end
