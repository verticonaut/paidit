//
//  PaymentsViewController.h
//  PaidIt
//
//  Created by Martin Schweizer on 16.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PaymentsViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate> {
	NSArray *payments;
	UITableView *tableView;
}

@property (nonatomic, retain) NSArray *payments;

-(IBAction)addPayment:(id)sender;


@end
