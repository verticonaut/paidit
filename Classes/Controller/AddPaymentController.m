//
//  PaymentDetailController.mPaymentDetailViewController
//  PaidIt
//
//  Created by Martin Schweizer on 21.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DateViewController.h"
#import "AddPaymentController.h"
#import "ValueTableCell.h"
#import "Payment.h"

@class Payment;

@implementation AddPaymentController

@synthesize payment;

- (IBAction)save:(id)sender {
	NSLog(@"save payment detail clicked");
	[self dismissModalViewControllerAnimated: TRUE];
}

-(IBAction)cancel:(id)sender {
	NSLog(@"cancel payment detail clicked");
	[self dismissModalViewControllerAnimated: TRUE];
}

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
			[cell setValue: self.payment.currency label: @"Currency" ];
			break;
			//		case kDateIndex:
		case 4:
			dateFormatter = [[NSDateFormatter alloc] init];
			[dateFormatter setDateFormat:@"MMMM dd, yyyy"];
			[cell setValue: [dateFormatter stringFromDate: self.payment.date] label: @"Date" ];
			[dateFormatter release];

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


 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
	[super viewDidLoad];
	 
	 if (self.payment == nil) {
		 self.payment = [[Payment alloc] init];
		 self.payment.date = [NSDate date];
		 self.navigationItem.title = @"Add Payment";
	 } else {
		 self.navigationItem.title = @"Edit Payment";
	 }
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
	[editTable reloadData];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSUInteger row = [indexPath row];
	NSLog(@"edit cell: {%d}", row);
	DateViewController *controller;
	switch (row) {
			//		case kPersonNameIndex:
		case 0:
			break;
			//		case kPaymentTypeIndex:
		case 1:
			break;
			//		case kAmountIndex:
		case 2:
			break;
			//		case kCurrencyIndex:
		case 3:
			break;
			//		case kDateIndex:
		case 4:
			controller = [[DateViewController alloc] init];
			controller.delegate = self;
			controller.date = payment.date;
			[self presentModalViewController:controller animated: TRUE];
			[controller release];
			break;
		default:
			break;
	}
	return nil;
}

#pragma mark -
#pragma mark DateController Protocoll impl
- (void)takeNewDate:(NSDate *)newDate
{
    payment.date = newDate;
	[editTable reloadData];
}


@end
