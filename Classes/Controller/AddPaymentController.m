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
#import "PaidItAppDelegate.h"
#import "SelectionListViewController.h"

@class Payment;

@implementation AddPaymentController

@synthesize payment;
@synthesize delegate;

- (Event*)getCurrentEvent {
	PaidItAppDelegate *paidItAppDelegate;
	paidItAppDelegate = (PaidItAppDelegate*)[[UIApplication sharedApplication] delegate];
	return [paidItAppDelegate currentEvent];
}

- (IBAction)save:(id)sender {
	NSLog(@"save payment detail clicked");
	[delegate paymentSaved: payment];
	[self dismissModalViewControllerAnimated: TRUE];
}

-(IBAction)cancel:(id)sender {
	[self dismissModalViewControllerAnimated: TRUE];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// TODO make constant
	return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	ValueTableCell *cell = (ValueTableCell*)[tableView dequeueReusableCellWithIdentifier:@"paymentDetailCell"];
	if (nil == cell)
	{
		cell = [[[ValueTableCell alloc] initWithFrame: CGRectZero reuseIdentifier: @"paymentDetailCell"] autorelease];
	}
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

	
	NSNumberFormatter *numberFormatter;
	NSDateFormatter *dateFormatter;
	NSUInteger row = [indexPath row];
	switch (row) {
		case 0: // kPersonNameIndex
			[cell setValue: self.payment.person.name label: @"Person" ];
			break;
		case 1: // kPaymentTypeIndex
			[cell setValue: self.payment.paymentType.name label: @"Payment Type" ];
			break;
		case 2: // kAmountIndex
			numberFormatter = [[[NSNumberFormatter alloc] init] autorelease];
			[numberFormatter setNumberStyle: NSNumberFormatterDecimalStyle];
			[numberFormatter setFormat:@"###.00"];
			[cell setValue: [NSString stringWithFormat:@"%@", [numberFormatter stringFromNumber: self.payment.amount]] label: @"Amount" ];
			cell.textField.enabled = TRUE;
			cell.textField.delegate = self;
			cell.textField.clearsOnBeginEditing = NO;
			[cell.textField addTarget:self 
							action: @selector(textFieldDone:) 
							forControlEvents: UIControlEventEditingDidEndOnExit];
			break;
		case 3: // kCurrencyIndex
			[cell setValue: self.payment.currency.name label: @"Currency" ];
			break;
		case 4: // kDateIndex
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
	[payment release];
    [super dealloc];
}

-(void)setPayment:(Payment *) newPayment {
	[payment release];
	payment = [[[Payment alloc] init] retain];
	if (nil != newPayment) {
		payment.person = newPayment.person;
		payment.currency = newPayment.currency;
		payment.paymentType = newPayment.paymentType;
		payment.amount = newPayment.amount;
		payment.date = newPayment.date;
	}
	[editTable reloadData];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSUInteger row = [indexPath row];
	NSLog(@"edit cell: {%d}", row);
	DateViewController *dateSelectController;
	SelectionListViewController *listSelectController;
	Event *event = [self.getCurrentEvent retain];
	
	switch (row) {
		case 0: // case kPersonNameIndex
            listSelectController = [[SelectionListViewController alloc] init];
            listSelectController.delegate = self;
            listSelectController.list = event.persons;
			listSelectController.propertySelector = @selector(name);
			listSelectController.indexTag = row;
			listSelectController.initialSelection = [event.persons indexOfObject: payment.person ];
			[self presentModalViewController: listSelectController animated: TRUE];
            [listSelectController release];

			break;
		case 1: // case kPaymentTypeIndex
            listSelectController = [[SelectionListViewController alloc] init];
            listSelectController.delegate = self;
            listSelectController.list = event.paymentTypes;
			listSelectController.propertySelector = @selector(name);
			listSelectController.indexTag = row;
			listSelectController.initialSelection = [event.paymentTypes indexOfObject: payment.paymentType ];
			[self presentModalViewController: listSelectController animated: TRUE];
            [listSelectController release];

			break;
		case 2: // case kAmountIndex
			// textField insode handles since it's enabled -> no action needed here
			break;
		case 3: // case kCurrencyIndex
            listSelectController = [[SelectionListViewController alloc] init];
            listSelectController.delegate = self;
            listSelectController.list = event.currencies;
			listSelectController.propertySelector = @selector(name);
			listSelectController.indexTag = row;
			listSelectController.initialSelection = [event.currencies indexOfObject: payment.currency ];
			[self presentModalViewController: listSelectController animated: TRUE];
            [listSelectController release];

			break;
		case 4: // case kDateIndex
			dateSelectController = [[DateViewController alloc] init];
			dateSelectController.delegate = self;
			dateSelectController.date = payment.date;
			listSelectController.indexTag = row;
			[self presentModalViewController: dateSelectController animated: TRUE];
			[dateSelectController release];
			break;
		default:
			break;
	}
	
	[event release];
	
	return nil;
}

#pragma mark -
#pragma mark DateController Protocoll impl
- (void)takeNewDate:(NSDate *)newDate
{
    payment.date = newDate;
	[editTable reloadData];
}


#pragma mark -
#pragma mark DateController Protocoll impl
- (void)rowChosen:(NSInteger)row indexTag:(NSUInteger)indexTag {
	NSLog(@"row choosen clicked: %d", indexTag);
	
	Event *event = [self.getCurrentEvent retain];

	switch (indexTag) {
		case 0: // case kPersonNameIndex
			payment.person = [event.persons objectAtIndex: row];
			break;
		case 1: // case kPaymentTypeIndex
			payment.paymentType = [event.paymentTypes objectAtIndex: row];
			break;
		case 2: // case kAmountIndex
			// textField insode handles - never comes here
			break;
		case 3: // case kCurrencyIndex
			payment.currency = [event.currencies objectAtIndex: row];
			break;
		case 4: // case kDateIndex
			// is date selector - nver comes here
			break;
		default:
			break;
	}
	
	[event release];
	[editTable reloadData];
}

#pragma mark -
#pragma mark Text Field Delegate Methods
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    payment.amount = [NSDecimalNumber decimalNumberWithString: textField.text];
}

-(BOOL)textFieldShouldReturn:(UITextField *)tf {
	[tf resignFirstResponder];
	return YES;
}

@end
