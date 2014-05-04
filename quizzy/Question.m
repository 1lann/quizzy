//
//  Question.m
//  quizzy
//
//  Created by Jason Chu on 5/3/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import "Question.h"

@interface Question ()

@property (readwrite) int maxAnswers;

@end

@implementation Question

- (id)init
{
    self = [super init];
    if (self) {
        self.maxAnswers = 4;
    }
    return self;
}

@end
