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

@interface EventsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate> {
	IBOutlet PaidItAppDelegate *appDelegate;
	IBOutlet AddEventsViewController *addEventController;
	IBOutlet UITableView *eventsTable;
	
	NSString *currentEventName;
	NSIndexPath *currentEventIndexPath;
}

@property (readwrite, copy) NSString *currentEventName;
@property (readwrite, copy) NSIndexPath *currentEventIndexPath;

-(IBAction)addEvent:(id)sender;
-(void)addNewEventNamed:(NSString *)eventName;

@end
