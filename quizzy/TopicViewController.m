//
//  TopicViewController.m
//  quizzy
//
//  Created by Jason Chu on 5/4/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import "TopicViewController.h"

@interface TopicViewController ()

@property Topic* topic;

@end

@implementation TopicViewController

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
    self.topic = [[Topic alloc] initWithTopic:self.rawTopicName];
    self.navigationController.topViewController.title = self.topic.name;
    self.descriptionLabel.text = self.topic.description;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
