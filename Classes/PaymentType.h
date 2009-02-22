//
//  PaymentType.h
//  PaidIt
//
//  Created by Martin Schweizer on 16.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PaymentType : NSObject {
	NSString* name;
	NSDecimalNumber* factor;
}

@property (readwrite, copy) NSString* name;
@property (readwrite, copy) NSDecimalNumber* factor;

@end
