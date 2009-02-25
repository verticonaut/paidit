//
//  PaymentDetailController.h
//  PaidIt
//
//  Created by Martin Schweizer on 21.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import	"Payment.h"

#define kNumberOfEditableRows	4;
#define kPersonNameIndex		0;
#define kPaymentTyoeIndex		1;
#define kAmountIndex			2;
#define kDateIndex				3;


@interface PaymentDetailController : UIViewController <UITableViewDataSource> {
}

@property (nonatomic, retain) Payment *payment;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;


@end
