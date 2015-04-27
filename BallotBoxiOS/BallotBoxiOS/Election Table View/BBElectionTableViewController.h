//
//  BBElectionTableViewController.h
//  BallotBoxiOS
//
//  Created by james grippo on 3/10/15.
//  Copyright (c) 2015 james grippo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBChoice.h"
#import "BBElection.h"

@interface BBElectionTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

-(void) setCurrentElection:(BBElection*) e;

@end
