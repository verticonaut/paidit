//
//  PaymentsViewController.h
//  PaidIt
//
//  Created by Martin Schweizer on 16.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kLabelDate		1
#define kLabelName		2
#define kLabelAmount	3
#define kLabelType		4
#define kLabelCurrency	5


@class PaidItAppDelegate;
@class PaymentDetailController;

@interface PaymentsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate> {
	NSMutableArray *payments;

	IBOutlet UITableViewCell *paymentCell;
	IBOutlet UITableView *paymentsTable;
	IBOutlet PaidItAppDelegate *appDelegate;
	IBOutlet PaymentDetailController *paymentDetailController;
	
	NSIndexPath *currentPaymentIndexPath;
}

@property (nonatomic, retain) NSMutableArray *payments;
@property (nonatomic, retain) NSIndexPath *currentPaymentIndexPath;

-(IBAction)addPayment:(id)sender;


@end
