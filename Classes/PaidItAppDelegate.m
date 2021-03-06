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
#import "Payment.h"


@implementation PaidItAppDelegate

@synthesize window;
@synthesize eventsController;
@synthesize allEvents;
@synthesize currentEvent;
@synthesize paymentDetailController;
@synthesize paymentsBaseController;

- (void)createDefaultData {
	self.allEvents = [NSMutableArray arrayWithObjects: [[Event initWithName: @"Rodellar"] retain], [[Event initWithName: @"Sardegna"] retain], nil];
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

- (Event *)getEventNamed:(NSString *)eventName {
	NSEnumerator *eventEnum = [allEvents objectEnumerator];
	id event;
	while (event = [eventEnum nextObject]) {
		if ([event name] == eventName) {
			return event;
		}
	}

	return nil;
}

-(void)eventClicked:(NSString *)eventName {
	NSLog(@"event name: %@", eventName);
	[self setCurrentEvent: [self getEventNamed: eventName]];
	[paymentsController setPayments: currentEvent.payments];
	
//TODO	[navController pushViewController: paymentsController animated: YES];
	paymentsBaseController.viewControllers = [NSArray arrayWithObjects: paymentsController, paymentDetailController, nil];
	[navController pushViewController: paymentsBaseController animated: YES];
}

-(void)paymentClicked:(Payment *) payment {
	[paymentDetailController setPayment: payment];
	[navController pushViewController: paymentDetailController animated: YES];
}

-(void)addNewEventNamed:(NSString *)eventName {
	[allEvents addObject: [[[Event alloc] initWithName: eventName] retain]];
}

-(void)deleteEventNamed:(NSString *)eventName atIndex: (NSUInteger) index {
	// may be need to search by name - index based might be not safe
	NSLog(@"deleting event named: %@ at index %d: ", eventName, index);
	[allEvents removeObjectAtIndex: 0];
}



- (void)dealloc {
	[allEvents release];
	[eventsController release];
	[paymentDetailController release];
    [window release];
	
    [super dealloc];
}

- (UINavigationController *)getNavController {
	return navController;
}

@end
