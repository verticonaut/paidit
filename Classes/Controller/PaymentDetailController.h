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
#import	"AddPaymentController.h"

@class AddPaymentController;
@class PaidItAppDelegate;
@class PaymentEditorDelegate;
 
#define kNumberOfEditableRows	4;
#define kPersonNameIndex		0;
#define kPaymentTypeIndex		1;
#define kAmountIndex			2;
#define kCurrencyIndex			3;
#define kDateIndex				4;


@interface PaymentDetailController : UIViewController <UITableViewDataSource, UITableViewDelegate, PaymentEditorDelegate> {
	Payment *payment;

	IBOutlet UITableView *detailTable;
	IBOutlet AddPaymentController *addPaymentController;
}

@property (readwrite, retain) Payment* payment;

@end
