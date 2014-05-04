//
//  QuizViewController.m
//  quizzy
//
//  Created by Jason Chu on 5/3/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import "MainMenuViewController.h"
// Temporary
#import "Topic.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	Topic* test = [[Topic alloc] initWithTopic:@"DemoTopic"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
