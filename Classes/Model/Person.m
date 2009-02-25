//
//  Person.m
//  PaidIt
//
//  Created by Martin Schweizer on 16.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person
@synthesize name;

#pragma mark Instantiation
- (id)init
{
	self = [super init];
	self.name = @">>default name";
	
	return self;
}

- (id)initWithName:(NSString*) aName
{
	self = [self init];
	
	self.name = aName;
	
	return self;
}

- (void)dealloc
{
	[self.name release];
	
	[super dealloc];
}


@end
