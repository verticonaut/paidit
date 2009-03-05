//
//  Event.m
//  PaidIt
//
//  Created by Martin Schweizer on 05.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Event.h"



@implementation Event

@synthesize name, date, payments, persons, paymentTypes, currencies;

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
	self.currencies = [[NSMutableArray alloc] initWithObjects: nil];
	
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

- (id)addCurrency:(Currency*) currency
{
	[self.currencies addObject: currency];
	
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

	// define initial paymentTypes
	PaymentType *food = [[PaymentType alloc] initWithName: @"Food"];
	PaymentType *gas = [[PaymentType alloc] initWithName: @"Gas"];
	[self addPaymentType: food];
	[self addPaymentType: gas];
	[food release];
	[gas release];
	
	// define initial currencies
	Currency *chf = [[Currency alloc] initWithName: @"CHF"];
	[self addCurrency: chf];
	Currency *eur = [[Currency alloc] initWithName: @"EUR"];
	[self addCurrency: eur];
	Currency *usd = [[Currency alloc] initWithName: @"USD"];
	[self addCurrency: usd];

	// define initial payments
	[self addPayment: [[Payment alloc] initWithPerson: peter paymentType: food amount: [NSDecimalNumber decimalNumberWithString: @"11.5"] currency: chf]];
	[self addPayment: [[Payment alloc] initWithPerson: peter paymentType: gas amount: [NSDecimalNumber decimalNumberWithString: @"22.0"] currency: chf]];
	[self addPayment: [[Payment alloc] initWithPerson: muster paymentType: food amount: [NSDecimalNumber decimalNumberWithString: @"99.0"] currency: eur]];
	[self addPayment: [[Payment alloc] initWithPerson: muster paymentType: gas amount: [NSDecimalNumber decimalNumberWithString: @"101.0"] currency: usd]];

	[chf release];
	[eur release];
	[usd release];
	
	return self;
}


- (void)dealloc
{
	[name release];
	[date release];
	[payments release];
	[persons release];
	[currencies release];	

	[super dealloc];
}

@end
