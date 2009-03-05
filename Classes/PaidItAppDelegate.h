//
//  PaidItAppDelegate.h
//  PaidIt
//
//  Created by Martin Schweizer on 05.02.09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import "Payment.h"

@class EventsViewController;
@class PaymentsViewController;
@class PaymentDetailController;

@interface PaidItAppDelegate : NSObject <UIApplicationDelegate> {
	// model
	NSMutableArray *allEvents;
	Event *currentEvent;

    IBOutlet UIWindow *window;
    IBOutlet EventsViewController *eventsController;
	IBOutlet UINavigationController *navController;
	IBOutlet PaymentsViewController *paymentsController;
	IBOutlet PaymentDetailController *paymentDetailController;
	
}

@property (nonatomic, retain) NSMutableArray *allEvents;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EventsViewController *eventsController;
@property (nonatomic, retain) IBOutlet PaymentsViewController *paymentsController;
@property (nonatomic, retain) IBOutlet PaymentDetailController *paymentDetailController;
@property (nonatomic, retain) Event *currentEvent;

-(void)eventClicked:(NSString *)eventName;
-(void)paymentClicked:(Payment *)payment;
-(void)addNewEventNamed:(NSString *)eventName;
-(void)deleteEventNamed:(NSString *)eventName atIndex: (NSUInteger) index;
-(UINavigationController *)getNavController;

@end

