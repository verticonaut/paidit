//
//  PaidItAppDelegate.m
//  PaidIt
//
//  Created by Martin Schweizer on 05.02.09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "PaidItAppDelegate.h"
#import "PaymentsViewController.h"
#import "Event.h"


@implementation PaidItAppDelegate

@synthesize window;
@synthesize eventsController;
@synthesize allEvents;

- (void)createDefaultData {
	self.allEvents = [NSMutableArray arrayWithObjects: [Event initWithName: @"Rodellar"], [Event initWithName: @"Sardegna"], nil];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    // Override point for customization after application launch
	
	// init view
	navController.viewControllers = [NSArray arrayWithObject: eventsController];
    [window addSubview: [navController view]];
    [window makeKeyAndVisible];
	
	// init data
	[self createDefaultData];
}

- (NSArray *)paymentsForEventNamed:(NSString *)eventName {
//	NSArray *payments = nil;
	NSEnumerator *eventEnum = [allEvents objectEnumerator];
	id event;
	while (event = [eventEnum nextObject]) {
		if ([event name] == eventName) {
			return [event payments];
		}
	}

	return nil;
}

-(void)eventClicked:(NSString *)eventName {
	NSLog(@"event name: %@", eventName);
	paymentsController.payments = [self paymentsForEventNamed: eventName];
	[navController pushViewController: paymentsController animated: YES];
}

-(void)addNewEventNamed:(NSString *)eventName {
	[allEvents addObject: [[[Event alloc] initWithName: eventName] retain]];
}



- (void)dealloc {
	[allEvents release];
	[eventsController release];
    [window release];
    [super dealloc];
}


@end
