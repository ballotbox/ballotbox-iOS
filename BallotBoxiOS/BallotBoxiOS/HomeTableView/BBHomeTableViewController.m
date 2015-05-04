//
//  BBHomeTableViewController.m
//  BallotBoxiOS
//
//  Created by james grippo on 3/10/15.
//  Copyright (c) 2015 james grippo. All rights reserved.
//

#import "BBHomeTableViewController.h"
#import "BBElectionTableViewController.h"
#import "BBHomeTableViewCell.h"
#import "BBCreateElectionTableTableViewController.h"

@interface BBHomeTableViewController ()
{
    NSMutableArray *Elections;
    NSMutableArray *Choices;
}

@end

@implementation BBHomeTableViewController

- (void)createElection:(id)sender
{
    BBCreateElectionTableTableViewController* dst = [[BBCreateElectionTableTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    BBElection* e = [[BBElection alloc]init];
    dst.currentElection = e;
    [self.navigationController showViewController:dst sender:self];
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[self tableView] registerClass:[BBHomeTableViewCell class] forCellReuseIdentifier:NSStringFromClass([BBHomeTableViewCell class])];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Elections";
    
    Elections = [[NSMutableArray alloc] init];
    Choices = [[NSMutableArray alloc] init];
    
    BBChoice *c = [[BBChoice alloc] init];
    c.name = @"Choice1";
    c.voteCount = 0;
    [Choices addObject:c];
    
    c = [[BBChoice alloc] init];
    c.name = @"Choice2";
    c.voteCount = 0;
    [Choices addObject:c];
    
    c = [[BBChoice alloc] init];
    c.name = @"Choice3";
    c.voteCount = 0;
    [Choices addObject:c];
    
    BBElection *elec = [[BBElection alloc] init];
    elec.name = @"Election1";
    elec.choices = Choices;
    [Elections addObject:elec];
    
    elec = [[BBElection alloc] init];
    elec.name = @"Election2";
    elec.choices = Choices;
    [Elections addObject:elec];
    
    elec = [[BBElection alloc] init];
    elec.name = @"Election3";
    elec.choices = Choices;
    [Elections addObject:elec];
    
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    UIBarButtonItem* createElectionBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(createElection:)];
    self.navigationItem.rightBarButtonItem = createElectionBarButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [Elections count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BBHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([BBHomeTableViewCell class]) forIndexPath:indexPath];
    // Configure the cell...
    BBElection* current = [Elections objectAtIndex:indexPath.row];
    cell.textLabel.text = [current name];

    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    // Passing the chosen election to display it's choices.
//    if ([[segue identifier] isEqualToString:@"ElectionSegue"])
//    {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        BBElectionTableViewController *dst = [segue destinationViewController];
//        BBElection* e = Elections[indexPath.row];
//        [dst setCurrentElection:e];
//
//    }
//    
//    // Pass a new BBElection object into create election.
//    if ([[segue identifier] isEqualToString:@"CreateElection"])
//    {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSInteger newRow = indexPath.row;
//        NSIndexPath *newElection = [NSIndexPath indexPathForRow:newRow inSection:indexPath.section];
//        BBCreateElectionTableTableViewController *dst = [segue destinationViewController];
//        BBElection* e = Elections[newElection.row];
//        //[dst createElection:e];
//    }
//    
//}


@end
