//
//  PaymentDetailController.mPaymentDetailViewController
//  PaidIt
//
//  Created by Martin Schweizer on 21.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

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
			dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
			[dateFormatter setDateFormat: @"yyyy-MM-dd"]; // 2009-12-24
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


 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
	[super viewDidLoad];
	 
	 if (self.payment == nil) {
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


- (void)viewWillAppear:(BOOL)animated 
{
	NSLog(@"view will appear");
	//	[self.parentViewController addSubview: self];
    [super viewWillAppear:animated];
}

-(void)setPayment:(Payment *) newPayment {
	[payment release];
	payment = [newPayment retain];
	[editTable reloadData];
}

@end
