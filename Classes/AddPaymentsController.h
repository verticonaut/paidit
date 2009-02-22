//
//  AddPaymentsController.h
//  PaidIt
//
//  Created by Martin Schweizer on 21.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EventsViewController;


@interface AddPaymentsViewController : UIViewController <UITableViewDataSource> {
	IBOutlet UITextField *textField;
	IBOutlet UITableViewCell *textFieldCell;
	IBOutlet EventsViewController *eventsViewController;
}

-(IBAction)save:(id)sender;
-(IBAction)cancel:(id)sender;


@end
