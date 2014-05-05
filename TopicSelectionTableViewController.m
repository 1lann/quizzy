//
//  TopicSelectionTableViewController.m
//  quizzy
//
//  Created by Jason Chu on 5/5/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import "TopicSelectionTableViewController.h"

@interface TopicSelectionTableViewController ()

@property NSMutableDictionary* availableTopics;
@property NSString* selectedTopic;

@end

@implementation TopicSelectionTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    Topic* topic = [[Topic alloc] init];
    self.availableTopics = topic.availableTopics;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.availableTopics count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger index = 0;
    for (NSString* key in self.availableTopics) {
        if (index == section) {
            return [self.availableTopics[key] count];
        }
        index++;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSInteger index = 0;
    for (NSString* key in self.availableTopics) {
        if (index == indexPath.section) {
            NSInteger topicIndex = 0;
            for (NSString* topicName in self.availableTopics[key]) {
                if (topicIndex == indexPath.row) {
                    cell.textLabel.text = self.availableTopics[key][topicName];
                }
                topicIndex++;
            }
        }
        index++;
    }

    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSInteger index = 0;
    for (NSString* key in self.availableTopics) {
        if (index == section) {
            return key;
        }
        index++;
    }
    return NULL;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = 0;
    for (NSString* key in self.availableTopics) {
        if (index == indexPath.section) {
            NSInteger topicIndex = 0;
            for (NSString* topicName in self.availableTopics[key]) {
                if (topicIndex == indexPath.row) {
                    self.selectedTopic = topicName;
                }
                topicIndex++;
            }
        }
        index++;
    }
    [self performSegueWithIdentifier:@"selectTopic" sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"selectTopic"]){
        TopicViewController* vc = [segue destinationViewController];
        vc.topicNameLabel = self.selectedTopic;
    }
}


@end
