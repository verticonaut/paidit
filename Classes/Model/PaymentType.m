//
//  PaymentType.m
//  PaidIt
//
//  Created by Martin Schweizer on 16.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PaymentType.h"


@implementation PaymentType

@synthesize name, factor;

#pragma mark Instantiation
- (id)init
{
	self = [super init];
	self.name = @">>default name";
	self.factor = [NSDecimalNumber decimalNumberWithString: @"1.0"];
	
	return self;
}

- (id)initWithName:(NSString*) aName
{
	return [self initWithName: aName factor:[NSDecimalNumber decimalNumberWithString: @"1.0"]];
}

- (id)initWithName:(NSString*) aName factor:(NSDecimalNumber*) aFactor
{
	self = [self init];
	
	self.name = aName;
	self.factor = aFactor;
	
	return self;
}

- (void)dealloc
{
	[self.name release];
	[self.factor release];
	
	[super dealloc];
}


@end
