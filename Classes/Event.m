//
//  Event.m
//  PaidIt
//
//  Created by Martin Schweizer on 05.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Event.h"



@implementation Event

@synthesize name, date, payments, persons, paymentTypes;

#pragma mark Instantiation
+ (id)initWithName:(NSString *) eventName {
	return [[[Event alloc] initWithName: eventName] autorelease];
}

- (id)init
{
	self = [super init];
	self.name = @">>default name";
	self.date = [NSDate date];
	self.paymentTypes = [[NSMutableArray alloc] initWithObjects: nil];
	self.persons = [[NSMutableArray alloc] initWithObjects: nil];
	self.payments = [[NSMutableArray alloc] initWithObjects: nil];
	
	[self initData];
	
	return self;
}

- (id)initWithName:(NSString*) aName
{
	self = [self init];
	
	self.name = aName;
	
	return self;
}

- (id)addPayment:(Payment*) payment
{
	[self.payments addObject: payment];
	
	return self;
}

- (id)addPerson:(Person*) person
{
	[self.persons addObject: person];
	
	return self;
}

- (id)addPaymentType:(PaymentType*) paymentType
{
	[self.paymentTypes addObject: paymentType];
	
	return self;
}

- (Event*)initData
{
	// START: test only
	Person *peter = [[Person alloc] initWithName: @"Peter"];
	Person *muster = [[Person alloc] initWithName: @"Muster"];
	[self addPerson: peter];
	[self addPerson: muster];
	[peter release];
	[muster release];

	// define initial paymentType
	PaymentType *food = [[PaymentType alloc] initWithName: @"Food"];
	PaymentType *gas = [[PaymentType alloc] initWithName: @"Gas"];
	[self addPaymentType: food];
	[self addPaymentType: gas];
	[food release];
	[gas release];
	
	// define initial payments
	[self addPayment: [[Payment alloc] initWithPerson: peter paymentType: food amount: [NSDecimalNumber decimalNumberWithString: @"1.0"]]];
	[self addPayment: [[Payment alloc] initWithPerson: peter paymentType: gas amount: [NSDecimalNumber decimalNumberWithString: @"22.0"]]];
	[self addPayment: [[Payment alloc] initWithPerson: muster paymentType: food amount: [NSDecimalNumber decimalNumberWithString: @"99.0"]]];
	[self addPayment: [[Payment alloc] initWithPerson: muster paymentType: muster amount: [NSDecimalNumber decimalNumberWithString: @"101.0"]]];

	return self;
}


- (void)dealloc
{
	[self.name release];
	[self.description release];
	[self.date release];
	[self.payments release];
	[self.persons release];

	[super dealloc];
}

@end
