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
#import "BBSwitchTableViewCell.h"
#import "BBManager.h"

@interface BBCreateElectionTableTableViewController ()
{
    NSInteger numberOfChoices;
}
@end

@implementation BBCreateElectionTableTableViewController

@synthesize currentElection;

- (void)viewDidLoad {
    [super viewDidLoad];
    numberOfChoices = 4;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChoiceToTableView: (id)sender
{
    numberOfChoices++;
    NSIndexPath* ip = [NSIndexPath indexPathForRow:(numberOfChoices-2) inSection:2];

    [self.tableView insertRowsAtIndexPaths: @[ip] withRowAnimation:UITableViewRowAnimationFade];
}

- (void) finishCreatingElection
{
    NSMutableArray* newElection = [[NSMutableArray alloc] init];
    NSMutableArray* Choices = [[NSMutableArray alloc] init];
    
    NSIndexPath* ip = [NSIndexPath indexPathForRow:0 inSection:0];
    [newElection addObject:ip];
    
    ip = [NSIndexPath indexPathForRow:0 inSection:1];
    [newElection addObject:ip];
    
    ip = [NSIndexPath indexPathForRow:1 inSection:0];
    [newElection addObject:ip];
    
    for(int i=0; i<numberOfChoices-1; ++i)
    {
        ip = [NSIndexPath indexPathForRow:i inSection:2];
        [newElection addObject:ip];
    }
    
    BBTextFieldTableViewCell * ipElectionTitle = (BBTextFieldTableViewCell*) [self.tableView cellForRowAtIndexPath:newElection[0]];
    BBTextViewTableViewCell *ipElectionBody = (BBTextViewTableViewCell*) [self.tableView cellForRowAtIndexPath:newElection[1]];
    BBSwitchTableViewCell *ipElectionPublic= (BBSwitchTableViewCell*) [self.tableView cellForRowAtIndexPath:newElection[2]];
    
    for(int i =3; i<numberOfChoices+2;++i)
    {
        BBTextFieldTableViewCell *temp3 = (BBTextFieldTableViewCell*) [self.tableView cellForRowAtIndexPath:newElection[i]];
        if(temp3.inputTextField.text.length == 0){}
        else
        {
            NSDictionary* choice = [[NSDictionary alloc] init];
            choice = @{ @"body" : temp3.inputTextField.text };
            [Choices addObject:choice];
        }

    }
    
    /*
     title = e.name = temp1.inputTextField.text;
     body = e.description = temp2.inputTextView.text;
    */
    
    NSDictionary* createElectionDictionary = @{
                                               @"title" : ipElectionTitle.inputTextField.text,
                                               @"body" : ipElectionBody.inputTextView.text,
                                               @"public" : [NSNumber numberWithBool:ipElectionPublic.publicSwitch.on],
                                               @"choices" : (NSArray*) Choices
                                               };
    NSDictionary* createElectionParameter = @{@"election": createElectionDictionary };
    
    [[BBManager sessionManager] POST:@"/api/v1/elections" parameters:createElectionParameter success:^(NSURLSessionDataTask *task, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    if ( section == 2)
    {
        return numberOfChoices;
    }
    else if ( section == 0)
    {
        return 2;
    }
    else
        return 1;
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
    self.tableView.bounces = YES;
    if (indexPath.section == 2 && indexPath.row == numberOfChoices-1)
    {
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"addChoice"];
        if(!cell)
        {
            cell = [[BBAddTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addChoice"];
        }
        BBAddTableViewCell* betterCell = (BBAddTableViewCell*) cell;
        [[betterCell addChoice] setTitle:@"tap here to add a choice" forState:UIControlStateNormal];
        [[betterCell addChoice] setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [[betterCell addChoice] addTarget:self action:@selector(addChoiceToTableView:) forControlEvents:UIControlEventTouchUpInside];
        return betterCell;
    }
    else if ( indexPath.section ==0 && indexPath.row == 1)
    {
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"publicSwitch"];
        if(!cell)
        {
            cell = [[BBSwitchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"publicSwitch"];
        }
        BBSwitchTableViewCell* betterCell = (BBSwitchTableViewCell*) cell;
        betterCell.textLabel.text = @"Public?";
        return betterCell;
    }
    else if ( indexPath.section == 1)
    {
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"textViewTableViewCell"];
        if(!cell)
        {
            cell = [[BBTextViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"textViewTableViewCell"];
        }
        BBTextViewTableViewCell* betterCell = (BBTextViewTableViewCell*) cell;
        betterCell.inputTextView.text = @"Tell us about your election. 😎";
        return betterCell;
    }
    else if ( indexPath.section == 3)
    {
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"done"];
        if(!cell)
        {
            cell = [[BBAddTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"done"];
        }
        BBAddTableViewCell* betterCell = (BBAddTableViewCell*) cell;
        [[betterCell addChoice] setTitle:@"tap here finish creating your election" forState:UIControlStateNormal];
        [[betterCell addChoice] setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [[betterCell addChoice] addTarget:self action:@selector(finishCreatingElection) forControlEvents:UIControlEventTouchUpInside];
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
    
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2)
    {
        return YES;
    }
    else{
        return NO;
    }
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView beginUpdates];
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        BBTextFieldTableViewCell * temp = (BBTextFieldTableViewCell*) [self.tableView cellForRowAtIndexPath:indexPath];
        temp.inputTextField.text = @"";
        numberOfChoices--;
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationTop];
    }
    [tableView endUpdates];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
