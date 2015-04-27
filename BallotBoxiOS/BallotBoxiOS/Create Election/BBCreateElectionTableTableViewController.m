//
//  BBCreateElectionTableTableViewController.m
//  BallotBoxiOS
//
//  Created by james grippo on 4/25/15.
//  Copyright (c) 2015 james grippo. All rights reserved.
//

#import "BBCreateElectionTableTableViewController.h"
#import "BBTextFieldTableViewCell.h"
#import "BBTextViewTableViewCell.h"
#import "BBAddTableViewCell.h"

@interface BBCreateElectionTableTableViewController ()
{
    NSInteger numberOfChoices;
    BBElection *currentElection;
}
@end

@implementation BBCreateElectionTableTableViewController

-(void) createElection:(BBElection *)e
{
    currentElection = e;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    numberOfChoices = 4;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    if ( section == 0 || section == 1)
    {
        return 1;
    }
    else
        return numberOfChoices;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    if (section == 2)
//    {
//        return 28*3;
//    }
//    else{
//        return 28;
//    }
//}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        return 44*3;
    }
    else
    {
        return 44;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell;
    if (indexPath.section == 2 && indexPath.row == numberOfChoices-1)
    {
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"addChoice"];
        if(!cell)
        {
            cell = [[BBAddTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addChoice"];
        }
        return cell;
    }
    if ( indexPath.section == 1)
    {
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"textViewTableViewCell"];
        if(!cell)
        {
            cell = [[BBTextViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"textViewTableViewCell"];
        }
        BBTextViewTableViewCell* betterCell = (BBTextViewTableViewCell*) cell;
        betterCell.inputTextView.text = @"Election Description";
        return betterCell;
    }
    else
    {
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"textFieldTableViewCell"];
        if(!cell)
        {
            cell = [[BBTextFieldTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"textFieldTableViewCell"];
        }
        BBTextFieldTableViewCell* betterCell = (BBTextFieldTableViewCell*) cell;
        betterCell.inputTextField.placeholder = (indexPath.section == 0 ? @"Election Name" : @"Election Choice");
        return betterCell;
    }
    
    
    // Configure the cell...
    
    //return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
