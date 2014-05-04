//
//  TopicStatisticView.h
//  quizzy
//
//  Created by Jason Chu on 5/4/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicStatisticsView : UIView

@property (weak, nonatomic) IBOutlet UILabel *correctLabel;
@property (weak, nonatomic) IBOutlet UILabel *incorrectLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *percentageBar;
@property (weak, nonatomic) IBOutlet UILabel *percentageLabel;

@end
