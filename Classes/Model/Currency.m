//
//  Currency.m
//  PaidIt
//
//  Created by Martin Schweizer on 05.03.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Currency.h"

@implementation Currency

@synthesize name, xRate;

#pragma mark Instantiation
- (id)init
{
	self = [super init];
	self.name = @">>default name";
	self.xRate = [NSDecimalNumber decimalNumberWithString: @"1.0"];
	
	return self;
}

- (id)initWithName:(NSString*) aName
{
	return [self initWithName: aName xRate:[NSDecimalNumber decimalNumberWithString: @"1.0"]];
}

- (id)initWithName:(NSString*) aName xRate:(NSDecimalNumber*) aRate
{
	self = [self init];
	
	self.name = aName;
	self.xRate = aRate;
	
	return self;
}

- (void)dealloc
{
	[self.name release];
	[self.xRate release];
	
	[super dealloc];
}


@end
