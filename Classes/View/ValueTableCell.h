//
//  ValueTableCell.h
//  PaidIt
//
//  Created by Martin Schweizer on 27.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ValueTableCell : UITableViewCell {
	UILabel *label;
	UITextField *textField;
}

@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UITextField *textField;

-(id) setValue:(NSString *) value label:(NSString *)label;
-(id) setValue:(NSString *) value;

@end
