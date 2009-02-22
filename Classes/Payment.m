//
//  Payment.m
//  PaidIt
//
//  Created by Martin Schweizer on 07.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Payment.h"


@implementation Payment
@synthesize person, paymentType, amount, date;

- (id)initWithPerson:(Person*) aPerson paymentType:(PaymentType*) aPaymentType amount:(NSDecimalNumber*) anAmount
{
	self = [self init];
	
	self.person = aPerson;
	self.paymentType = aPaymentType;
	self.amount = anAmount;
	self.date = [NSDate date];
	
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
	
	[super dealloc];
}


@end
