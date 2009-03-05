//
//  PaymentsViewController.h
//  PaidIt
//
//  Created by Martin Schweizer on 16.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

#define kLabelDate		1
#define kLabelName		2
#define kLabelAmount	3
#define kLabelType		4
#define kLabelCurrency	5


@class PaidItAppDelegate;
@class AddPaymentController;
@class Event;


@interface PaymentsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate> {
	Event *event;
	NSMutableArray *payments;

	IBOutlet UITableViewCell *paymentCell;
	IBOutlet UITableView *paymentsTable;
	IBOutlet PaidItAppDelegate *appDelegate;
	IBOutlet AddPaymentController *addPaymentController;
	
	NSIndexPath *currentPaymentIndexPath;
}

@property (readwrite, retain) Event* event;
@property (nonatomic, retain) NSMutableArray *payments;
@property (nonatomic, retain) NSIndexPath *currentPaymentIndexPath;

-(IBAction)addPayment:(id)sender;


@end
