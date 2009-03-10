//
//  PaymentDetailController.h
//  PaidIt
//
//  Created by Martin Schweizer on 21.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import	"Payment.h"
#import	"PaidItAppDelegate.h"
#import	"DateViewController.h"
#import	"SelectionListViewController.h"

#define kNumberOfEditableRows	4;
#define kPersonNameIndex		0;
#define kPaymentTypeIndex		1;
#define kAmountIndex			2;
#define kCurrencyIndex			3;
#define kDateIndex				4;

@protocol PaymentEditorDelegate <NSObject>
	@required
	- (void)paymentSaved:(Payment *)payment;
@end


@interface AddPaymentController : UIViewController <UITableViewDataSource, UITableViewDelegate, DateViewDelegate, SelectionListViewControllerDelegate, UITextFieldDelegate> {
	Payment *payment;
	
	IBOutlet UITableView *editTable;
	IBOutlet PaidItAppDelegate *appDelegate;
	UITextField *textFieldBeingEdited;
	
    id <PaymentEditorDelegate> delegate;
}

@property (readwrite, assign) Payment* payment;
@property (nonatomic, assign) id <PaymentEditorDelegate> delegate;
@property (nonatomic, retain) UITextField *textFieldBeingEdited;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

- (void)rowChosen: (NSInteger)row;


@end
