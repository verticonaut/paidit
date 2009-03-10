//
//  Payment.m
//  PaidIt
//
//  Created by Martin Schweizer on 07.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Payment.h"
#import "Currency.h"


@implementation Payment
@synthesize person, paymentType, amount, date, currency;

- (id) init {
	self = [super init];
	
	self.date = [NSDate date];
	
	return self;
}

- (id)initWithPerson:(Person*) aPerson paymentType:(PaymentType*) aPaymentType amount:(NSDecimalNumber*) anAmount currency:(Currency*) aCurrency
{
	self = [self init];
	
	self.person = aPerson;
	self.paymentType = aPaymentType;
	self.amount = anAmount;
	self.currency = aCurrency;
	
	return self;
}


- (NSString*) desc {
	return [NSString stringWithFormat: @"P: %@ T: %@ Amt: %d", self.person.name, self.paymentType.name, self.amount.decimalValue];
};

- (void)dealloc
{
	[self.person release];
	[self.paymentType release];
	[self.amount release];
	[self.date release];
	[self.currency release];
	
	[super dealloc];
}

- (BOOL)isValid {
	return
		nil != self.person
	&&  nil != self.paymentType
	&&	nil != self.amount
	&&  self.amount.doubleValue > 0.0
	&&  nil != self.date
	&&  nil != self.currency;
}

@end
