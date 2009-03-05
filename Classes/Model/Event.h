//
//  Event.h
//  PaidIt
//
//  Created by Martin Schweizer on 05.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Payment.h"
#import "PaymentType.h"



@interface Event : NSObject {
	NSString* name;
	NSDate*   date;
	NSMutableArray*  payments;
	NSMutableArray*	 persons;
	NSMutableArray*	 paymentTypes;
	NSMutableArray*	 currencies;
}

@property (readwrite, copy) NSString* name;
@property (readwrite, assign) NSDate* date;
@property (readwrite, assign) NSMutableArray* payments;
@property (readwrite, assign) NSMutableArray* persons;
@property (readwrite, assign) NSMutableArray* paymentTypes;
@property (readwrite, assign) NSMutableArray* currencies;

- (id)addPayment:(Payment*) payment;
- (id)addPerson:(Person*) person;
- (id)addPaymentType:(PaymentType*) paymentType;


@end
