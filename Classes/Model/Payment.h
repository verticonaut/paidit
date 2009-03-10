//
//  Payment.h
//  PaidIt
//
//  Created by Martin Schweizer on 07.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "PaymentType.h"
#import "Currency.h"

@interface Payment : NSObject {
	Person* person;
	PaymentType* paymentType;
	NSDecimalNumber* amount;
	NSDate *date;
	Currency *currency;
}

@property (readwrite, assign) Person* person;
@property (readwrite, assign) PaymentType* paymentType;
@property (readwrite, copy) NSDecimalNumber* amount;
@property (readwrite, copy) NSDate* date;
@property (readwrite, assign) Currency* currency;

- (NSString*)desc;
- (BOOL)isValid;

@end
