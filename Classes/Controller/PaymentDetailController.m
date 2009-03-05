//
//  PaymentDetailController.mPaymentDetailViewController
//  PaidIt
//
//  Created by Martin Schweizer on 21.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PaymentDetailController.h"
#import "ValueTableCell.h"
#import "Payment.h"

@class Payment;


@implementation PaymentDetailController

@synthesize payment;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// TODO make constant
	return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"paymentDetailCell"];
	if (nil == cell)
	{
		cell = [[[ValueTableCell alloc] initWithFrame: CGRectZero reuseIdentifier: @"paymentDetailCell"] autorelease];
	}

	NSNumberFormatter *numberFormatter;
	NSDateFormatter *dateFormatter;
	NSUInteger row = [indexPath row];
	switch (row) {
//		case kPersonNameIndex:
		case 0:
			[cell setValue: self.payment.person.name label: @"Person" ];
			break;
//		case kPaymentTypeIndex:
		case 1:
			[cell setValue: self.payment.paymentType.name label: @"Payment Type" ];
			break;
//		case kAmountIndex:
		case 2:
			numberFormatter = [[[NSNumberFormatter alloc] init] autorelease];
			[numberFormatter setNumberStyle: NSNumberFormatterDecimalStyle];
			[numberFormatter setFormat:@"###.00"];
			[cell setValue: [NSString stringWithFormat:@"%@", [numberFormatter stringFromNumber: self.payment.amount]] label: @"Amount" ];
			break;
//		case kCurrencyIndex:
		case 3:
			[cell setValue: self.payment.currency.name label: @"Currency" ];
			break;
//		case kDateIndex:
		case 4:
			dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
			[dateFormatter setDateFormat: @"MMMM dd, yyyy"];
			[cell setValue: [dateFormatter stringFromDate: self.payment.date] label: @"Date" ];
			break;
		default:
			break;
	}
	
	return cell;
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

-(IBAction)editPayment:(id)sender {
	[addPaymentController setPayment: payment];
	[addPaymentController setDelegate: self];
	[self presentModalViewController: addPaymentController animated:TRUE];
}

- (void)paymentSaved:(Payment *)aPayment {
	payment.person = aPayment.person;
	payment.paymentType = aPayment.paymentType;
	payment.amount = aPayment.amount;
	payment.currency = aPayment.currency;
	payment.date = aPayment.date;
	
	[detailTable reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];

	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]
											   initWithBarButtonSystemItem: UIBarButtonSystemItemEdit
											   target:self
											   action:@selector(editPayment:)] autorelease];
 }

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

-(void)setPayment:(Payment *) newPayment {
	[payment release];
	payment = [newPayment retain];
	[detailTable reloadData];
}

- (void)viewWillAppear:(BOOL)animated 
{
	NSLog(@"detail will appear");
//	[self.parentViewController addSubview: self];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	NSLog(@"detail will disappear");
	[super viewWillDisappear: animated];
}

@end
