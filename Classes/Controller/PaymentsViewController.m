//
//  PaymentsViewController.m
//  PaidIt
//
//  Created by Martin Schweizer on 16.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PaidItAppDelegate.h"
#import "PaymentsViewController.h"
#import "AddPaymentController.h"
#import "Event.h"
#import "Payment.h"


@implementation PaymentsViewController

@synthesize payments;
@synthesize currentPaymentIndexPath;

- (void)paymentSaved:(Payment *)aPayment {
	[payments addObject: [aPayment retain]];
	[paymentsTable reloadData];	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.payments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CELL_IDENTIFIER = @"CellIdentPayment";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CELL_IDENTIFIER];
	if (nil == cell)
	{
		/*
		cell = paymentCell;
		NSLog(@"%@", cell.reuseIdentifier);
		*/
		NSArray *nib = [[NSBundle mainBundle]
							loadNibNamed: @"PaymentTableCell"
						owner: self
						options: nil];
		cell = [nib objectAtIndex: 0];
	}
	
	Payment *payment = [self.payments objectAtIndex:indexPath.row];
	
	UILabel *label;
	
	label = (UILabel *)[cell.contentView viewWithTag: kLabelDate ];
	NSDateFormatter *dateFormat = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormat setDateFormat: @"yyyy-MM-dd"]; // 2009-12-24
	label.text = [dateFormat stringFromDate: payment.date];
	
	label = (UILabel *)[cell.contentView viewWithTag: kLabelName ];
	label.text = payment.person.name;

	label = (UILabel *)[cell.contentView viewWithTag: kLabelAmount ];
	NSNumberFormatter *formatter = [[[NSNumberFormatter alloc] init] autorelease];
	[formatter setNumberStyle:NSNumberFormatterDecimalStyle];
	[formatter setFormat:@"###.00"];
	label.text = [NSString stringWithFormat:@"%@", [formatter stringFromNumber: payment.amount]];

	label = (UILabel *)[cell.contentView viewWithTag: kLabelType ];
	label.text = payment.paymentType.name;

	label = (UILabel *)[cell.contentView viewWithTag: kLabelCurrency ];	
	label.text = payment.currency.name;
	
	//	cell.text = [[self.payments objectAtIndex:indexPath.row] desc];

	cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

	return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"clicked payment: {%d}", indexPath.row);
	Payment *dummy = [payments objectAtIndex: indexPath.row ];
	
	[appDelegate paymentClicked: dummy];
	return nil;
}

- (void)setPayments:(NSMutableArray *)newPayments {
	[payments release];
	payments = [newPayments retain];
	[paymentsTable reloadData];
}

-(IBAction)addPayment:(id)sender {
	[addPaymentController setPayment: nil];
	[addPaymentController setDelegate: self];
	[self presentModalViewController: addPaymentController animated:TRUE];
}

// does not need??
/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 50;
}
 */

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]
											   initWithBarButtonSystemItem: UIBarButtonSystemItemAdd
											   target:self
											   action:@selector(addPayment:)] autorelease];
 }

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	// If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		// store current payment index path (how to pass to actionSheet callback else?
		currentPaymentIndexPath = indexPath;
		
		// present confirmation action sheet
		UIActionSheet *actionSheet = [[UIActionSheet alloc]
									  initWithTitle: @"Delete the payment entry?"
									  delegate: self
									  cancelButtonTitle: @"Cancel"
									  destructiveButtonTitle: @"Delete payment"
									  otherButtonTitles: nil];
		
		[actionSheet showInView: [self view]];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (0 == buttonIndex) {
		// delete button pressed
		[payments removeObjectAtIndex: currentPaymentIndexPath.row];
		[paymentsTable deleteRowsAtIndexPaths:[NSArray arrayWithObject: currentPaymentIndexPath] withRowAnimation: UITableViewRowAnimationFade];  
	}
	[currentPaymentIndexPath release];
	[actionSheet release];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated 
{
	NSLog(@"payments will appear");
	//	[self.parentViewController addSubview: self];
	[paymentsTable reloadData];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	NSLog(@"payments will disappear");
	[super viewWillDisappear: animated];
}



@end
