//
//  PaidItAppDelegate.h
//  PaidIt
//
//  Created by Martin Schweizer on 05.02.09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EventsViewController;
@class PaymentsViewController;

@interface PaidItAppDelegate : NSObject <UIApplicationDelegate> {
    IBOutlet UIWindow *window;
    IBOutlet EventsViewController *eventsController;
	IBOutlet UINavigationController *navController;
	IBOutlet PaymentsViewController *paymentsController;
	
	// model
	NSMutableArray *allEvents;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EventsViewController *eventsController;
@property (nonatomic, retain) IBOutlet PaymentsViewController *paymentsController;
@property (nonatomic, retain) NSMutableArray *allEvents;

-(void)eventClicked:(NSString *)eventName;
-(void)addNewEventNamed:(NSString *)eventName;
-(void)deleteEventNamed:(NSString *)eventName atIndex: (NSUInteger) index;

@end

