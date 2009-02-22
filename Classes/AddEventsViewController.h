//
//  AddEventsViewController.h
//  PaidIt
//
//  Created by Martin Schweizer on 18.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EventsViewController;


@interface AddEventsViewController : UIViewController <UITableViewDataSource> {
	IBOutlet UITextField *textField;
	IBOutlet UITableViewCell *textFieldCell;
	IBOutlet EventsViewController *eventsViewController;
}

-(IBAction)save:(id)sender;
-(IBAction)cancel:(id)sender;


@end
