//
//  EventsViewController.h
//  PaidIt
//
//  Created by Martin Schweizer on 16.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PaidItAppDelegate;
@class AddEventsViewController;

@interface EventsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	IBOutlet PaidItAppDelegate *appDelegate;
	IBOutlet AddEventsViewController *addEventController;
	IBOutlet UITableView *eventsTable;
}

-(IBAction)addEvent:(id)sender;
-(void)addNewEventNamed:(NSString *)eventName;

@end
