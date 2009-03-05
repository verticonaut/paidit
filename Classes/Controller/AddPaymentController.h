//
//  PaymentDetailController.h
//  PaidIt
//
//  Created by Martin Schweizer on 21.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import	"Event.h"
#import	"Payment.h"
#import	"PaidItAppDelegate.h"

#define kNumberOfEditableRows	4;
#define kPersonNameIndex		0;
#define kPaymentTypeIndex		1;
#define kAmountIndex			2;
#define kCurrencyIndex			3;
#define kDateIndex				4;


@interface AddPaymentController : UIViewController <UITableViewDataSource, UITableViewDelegate, DateViewDelegate> {
	Event *event;
	Payment *payment;
	
	IBOutlet UITableView *editTable;
	IBOutlet PaidItAppDelegate *appDelegate;
}

@property (readwrite, retain) Event* event;
@property (readwrite, retain) Payment* payment;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

- (void)rowChosen: (NSInteger)row;


@end
