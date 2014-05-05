//
//  TopicViewController.h
//  quizzy
//
//  Created by Jason Chu on 5/4/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *topicNameLabel;
@property NSString* rawTopicName;

@end
