//
//  SPQuestionViewController.h
//  quizzy
//
//  Created by Jason Chu on 5/7/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Topic.h"

@interface SPQuestionViewController : UIViewController

@property Topic *topic;

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionTextLabel;

@property (weak, nonatomic) IBOutlet UIProgressView *progressProgressView;
@property (weak, nonatomic) IBOutlet UIProgressView *timerProgressView;

@property (weak, nonatomic) IBOutlet UIButton *optionOne;
@property (weak, nonatomic) IBOutlet UIButton *optionTwo;
@property (weak, nonatomic) IBOutlet UIButton *optionThree;
@property (weak, nonatomic) IBOutlet UIButton *optionFour;

- (IBAction)optionOnePressed:(UIButton *)sender;
- (IBAction)optionTwoPressed:(UIButton *)sender;
- (IBAction)optionThreePressed:(UIButton *)sender;
- (IBAction)optionFourPressed:(UIButton *)sender;


@end
