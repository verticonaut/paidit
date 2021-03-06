//
//  AddEventsViewController.m
//  PaidIt
//
//  Created by Martin Schweizer on 18.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AddEventsViewController.h"
#import "EventsViewController.h"


@implementation AddEventsViewController


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCell"];
	if (nil == cell)
	{
		cell = textFieldCell;
	}
	return cell;
}

-(IBAction)save:(id)sender {
	NSString *eventName = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	
	if ([eventName length] == 0) {
		UIAlertView *alert = [[UIAlertView alloc]
			initWithTitle: @"Invalid input"
			message:@"Event name can not be empty"
			delegate: self
			cancelButtonTitle: @"Ok"
			otherButtonTitles: nil];
		[alert show];
		[alert release];
	} else {
		[eventsViewController addNewEventNamed: eventName];
		[self dismissModalViewControllerAnimated: TRUE];
		textField.text = @"";
	}
}

-(IBAction)cancel:(id)sender {
	[self dismissModalViewControllerAnimated: TRUE];
	textField.text = @"";
}

-(void)textFieldDidEndEditing:(UITextField *)tf {
//	[self save: tf];
}

-(BOOL)textFieldShouldReturn:(UITextField *)tf {
	[textField resignFirstResponder];
	return YES;
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
