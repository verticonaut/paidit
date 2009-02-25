//
//  EventsViewController.m
//  PaidIt
//
//  Created by Martin Schweizer on 16.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "EventsViewController.h"
#import "Event.h"
#import "PaidItAppDelegate.h"


@implementation EventsViewController

@synthesize currentEventName, currentEventIndexPath;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[appDelegate allEvents] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell"];
	if (nil == cell)
	{
		cell = [[[UITableViewCell alloc] initWithFrame: CGRectZero reuseIdentifier: @"eventCell"] autorelease];
	}
	
	Event *event = [[appDelegate allEvents] objectAtIndex: indexPath.row];
	//cell.text = @"Event  %d", indexPath.row;
	cell.text = event.name;
	// [event release];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"clicked event: {%d}", indexPath.row);
	[appDelegate eventClicked: [[tableView cellForRowAtIndexPath:indexPath] text]];
	return nil;
}

-(IBAction)addEvent:(id)sender {
	[self presentModalViewController: addEventController animated: TRUE];
}

-(void)addNewEventNamed:(NSString *)eventName {
	[appDelegate addNewEventNamed: eventName];
	[eventsTable reloadData];
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
											  action:@selector(addEvent:)] autorelease];
	
	// [eventsTable setEditing: TRUE animated: YES ];
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

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	// If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		// store current event (how to pass to actionSheet callback else?
		currentEventName = [[tableView cellForRowAtIndexPath: indexPath] text];
		currentEventIndexPath = indexPath;
		
		// present confirmation action sheet
		UIActionSheet *actionSheet = [[UIActionSheet alloc]
											initWithTitle: @"Delete event with all related data?"
											delegate: self
											cancelButtonTitle: @"Cancel"
											destructiveButtonTitle: @"Delete event"
											otherButtonTitles: nil];
		[actionSheet showInView: [self view]];
    }
}
	

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (0 == buttonIndex) {
		// delete button pressed
		[appDelegate deleteEventNamed: currentEventName atIndex: currentEventIndexPath.row ];

		[eventsTable deleteRowsAtIndexPaths:[NSArray arrayWithObject: currentEventIndexPath] withRowAnimation:UITableViewRowAnimationFade];  
	}
	
	[actionSheet release];
}



@end
