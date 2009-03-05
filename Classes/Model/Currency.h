//
//  Currency.h
//  PaidIt
//
//  Created by Martin Schweizer on 05.03.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Currency : NSObject {
	NSString* name;
	NSDecimalNumber* xRate;
}

@property (readwrite, copy) NSString* name;
@property (readwrite, copy) NSDecimalNumber* xRate;

@end
