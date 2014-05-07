//
//  SPQuestionViewController.m
//  quizzy
//
//  Created by Jason Chu on 5/7/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import "SPQuestionViewController.h"

@interface SPQuestionViewController ()

@property NSInteger questionNumber;
@property NSInteger score;
@property Question *currentQuestion;
@property SEL dispQuestSel;

@end

@implementation SPQuestionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.questionNumber = 0;
    self.score = 0;
    self.currentQuestion = [self.topic generateQuestionWithLevel:0 previousQuestions:@[]];
    self.dispQuestSel = @selector(displayQuestion:clear:);
    [self displayQuestion:self.currentQuestion clear:FALSE];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)displayQuestion:(Question *)question clear:(BOOL)clear {
    self.questionNumber++;
    self.questionLabel.text = [NSString stringWithFormat:@"Question: %i", self.questionNumber];
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", self.score];
    
    if (clear) {
        [UIView animateWithDuration:0.5 animations:^{
            self.questionTextLabel.alpha = 0.0;
            
            self.optionOne.alpha = 0.0;
            self.optionTwo.alpha = 0.0;
            self.optionThree.alpha = 0.0;
            self.optionFour.alpha = 0.0;
        } completion:^(BOOL finished){
            self.questionTextLabel.text = question.question;
            
            [self.optionOne setTitle:question.answers[0] forState:UIControlStateNormal];
            [self.optionTwo setTitle:question.answers[1] forState:UIControlStateNormal];
            [self.optionThree setTitle:question.answers[2] forState:UIControlStateNormal];
            [self.optionFour setTitle:question.answers[3] forState:UIControlStateNormal];
            
            [UIView animateWithDuration:0.5 animations:^{
                self.questionTextLabel.alpha = 1.0;
            } completion:^(BOOL finished){
                [UIView animateWithDuration:1.0 animations:^{
                    
                } completion:^(BOOL finished){
                    [UIView animateWithDuration:0.5 animations:^{
                        self.optionOne.alpha = 1.0;
                        self.optionTwo.alpha = 1.0;
                        self.optionThree.alpha = 1.0;
                        self.optionFour.alpha = 1.0;
                    }];
                }];
            }];
        }];
    } else {
        self.questionTextLabel.alpha = 1.0;
        
        self.optionOne.alpha = 1.0;
        self.optionTwo.alpha = 1.0;
        self.optionThree.alpha = 1.0;
        self.optionFour.alpha = 1.0;
        
        self.questionTextLabel.text = question.question;
        
        [self.optionOne setTitle:question.answers[0] forState:UIControlStateNormal];
        [self.optionTwo setTitle:question.answers[1] forState:UIControlStateNormal];
        [self.optionThree setTitle:question.answers[2] forState:UIControlStateNormal];
        [self.optionFour setTitle:question.answers[3] forState:UIControlStateNormal];
        NSLog(@"SET AND READY!");
    }
}

- (IBAction)optionOnePressed:(UIButton *)sender {
    if (self.currentQuestion.correctAnswerIndex == 0) {
        self.score++;
        self.optionOne.titleLabel.textColor = [UIColor colorWithRed:0.0 green:204.0/255.0 blue:0.0 alpha:1.0];
    } else {
        self.optionOne.titleLabel.textColor = [UIColor colorWithRed:198.0/255.0 green:56.0/255.0 blue:56.0/255.0 alpha:1.0];
        if (self.currentQuestion.correctAnswerIndex == 1) {
            self.optionTwo.titleLabel.textColor = [UIColor colorWithRed:0.0 green:204.0/255.0 blue:0.0 alpha:1.0];
        } else if (self.currentQuestion.correctAnswerIndex == 2) {
            self.optionThree.titleLabel.textColor = [UIColor colorWithRed:0.0 green:204.0/255.0 blue:0.0 alpha:1.0];
        } else if (self.currentQuestion.correctAnswerIndex == 3) {
            self.optionFour.titleLabel.textColor = [UIColor colorWithRed:0.0 green:204.0/255.0 blue:0.0 alpha:1.0];
        }
    }
    [UIView animateWithDuration:2.0 animations:^{self.questionTextLabel.alpha = 1;} completion:^(BOOL finished) {
        [self displayQuestion:[self.topic generateQuestionWithLevel:0 previousQuestions:@[]] clear:TRUE];
    }];
}

- (IBAction)optionTwoPressed:(UIButton *)sender {
    if (self.currentQuestion.correctAnswerIndex == 1) {
        self.score++;
        self.optionTwo.titleLabel.textColor = [UIColor colorWithRed:0.0 green:204.0/255.0 blue:0.0 alpha:1.0];
    } else {
        self.optionTwo.titleLabel.textColor = [UIColor colorWithRed:198.0/255.0 green:56.0/255.0 blue:56.0/255.0 alpha:1.0];
        if (self.currentQuestion.correctAnswerIndex == 0) {
            self.optionOne.titleLabel.textColor = [UIColor colorWithRed:0.0 green:204.0/255.0 blue:0.0 alpha:1.0];
        } else if (self.currentQuestion.correctAnswerIndex == 2) {
            self.optionThree.titleLabel.textColor = [UIColor colorWithRed:0.0 green:204.0/255.0 blue:0.0 alpha:1.0];
        } else if (self.currentQuestion.correctAnswerIndex == 3) {
            self.optionFour.titleLabel.textColor = [UIColor colorWithRed:0.0 green:204.0/255.0 blue:0.0 alpha:1.0];
        }
    }
    [UIView animateWithDuration:2.0 animations:^{self.questionTextLabel.alpha = 1;} completion:^(BOOL finished) {
        [self displayQuestion:[self.topic generateQuestionWithLevel:0 previousQuestions:@[]] clear:TRUE];
    }];
}

- (IBAction)optionThreePressed:(UIButton *)sender {
    if (self.currentQuestion.correctAnswerIndex == 2) {
        self.score++;
        self.optionThree.titleLabel.textColor = [UIColor colorWithRed:0.0 green:204.0/255.0 blue:0.0 alpha:1.0];
    } else {
        self.optionThree.titleLabel.textColor = [UIColor colorWithRed:198.0/255.0 green:56.0/255.0 blue:56.0/255.0 alpha:1.0];
        if (self.currentQuestion.correctAnswerIndex == 0) {
            self.optionOne.titleLabel.textColor = [UIColor colorWithRed:0.0 green:204.0/255.0 blue:0.0 alpha:1.0];
        } else if (self.currentQuestion.correctAnswerIndex == 1) {
            self.optionTwo.titleLabel.textColor = [UIColor colorWithRed:0.0 green:204.0/255.0 blue:0.0 alpha:1.0];
        } else if (self.currentQuestion.correctAnswerIndex == 3) {
            self.optionFour.titleLabel.textColor = [UIColor colorWithRed:0.0 green:204.0/255.0 blue:0.0 alpha:1.0];
        }
    }
}

- (IBAction)optionFourPressed:(UIButton *)sender {
    if (self.currentQuestion.correctAnswerIndex == 3) {
        self.score++;
        self.optionFour.titleLabel.textColor = [UIColor colorWithRed:0.0 green:204.0/255.0 blue:0.0 alpha:1.0];
    } else {
        self.optionFour.titleLabel.textColor = [UIColor colorWithRed:198.0/255.0 green:56.0/255.0 blue:56.0/255.0 alpha:1.0];
        if (self.currentQuestion.correctAnswerIndex == 0) {
            self.optionOne.titleLabel.textColor = [UIColor colorWithRed:0.0 green:204.0/255.0 blue:0.0 alpha:1.0];
        } else if (self.currentQuestion.correctAnswerIndex == 1) {
            self.optionTwo.titleLabel.textColor = [UIColor colorWithRed:0.0 green:204.0/255.0 blue:0.0 alpha:1.0];
        } else if (self.currentQuestion.correctAnswerIndex == 2) {
            self.optionThree.titleLabel.textColor = [UIColor colorWithRed:0.0 green:204.0/255.0 blue:0.0 alpha:1.0];
        }
    }
    [UIView animateWithDuration:2.0 animations:^{self.questionTextLabel.alpha = 1;} completion:^(BOOL finished) {
        [self displayQuestion:[self.topic generateQuestionWithLevel:0 previousQuestions:@[]] clear:TRUE];
    }];
}
@end
