//
//  PaymentsViewController.m
//  PaidIt
//
//  Created by Martin Schweizer on 16.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PaymentsViewController.h"


@implementation PaymentsViewController

@synthesize payments;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.payments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"paymentCell"];
	if (nil == cell)
	{
		cell = [[[UITableViewCell alloc] initWithFrame: CGRectZero reuseIdentifier: @"paymentCell"] autorelease];
	}
	
	cell.text = [[self.payments objectAtIndex:indexPath.row] desc];
	cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

	return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"clicked payment: {%d}", indexPath.row);
	return nil;
}

- (void)setPayments:(NSArray *)newPayments {
	[payments release];
	payments = [newPayments retain];
	[tableView reloadData];
}

-(IBAction)addPayment:(id)sender {
	[self presentModalViewController:paymentDetailController animated:TRUE];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end
