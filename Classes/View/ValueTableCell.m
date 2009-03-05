//
//  ValueTableCell.m
//  PaidIt
//
//  Created by Martin Schweizer on 27.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "ValueTableCell.h"


@implementation ValueTableCell

@synthesize label, textField;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
		// add label
		label = [[UILabel alloc] initWithFrame: CGRectMake(15.0, 16.0, 120.0, 15.0)];
		label.font = [UIFont boldSystemFontOfSize: 14];
		label.text = @"LABEL to be set ...";
		
		[self.contentView addSubview: label ];

		// add textField
		textField = [[UITextField alloc] initWithFrame: CGRectMake(125.0, 16.0, 150.0, 15.0)];
		textField.placeholder = @"edit value ...";
		textField.returnKeyType = UIReturnKeyDone;
		textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
		textField.font = [UIFont systemFontOfSize: 14];	
		textField.enabled = FALSE;
		
		[self.contentView addSubview: textField ];
	}
	
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id) setValue:(NSString *)value label:(NSString *)aLabel {
	NSString *newLabel;
	newLabel = [aLabel stringByAppendingString: @" :"];
	label.text = newLabel;
	textField.text = value;

	return self;
}

-(id) setValue:(NSString *) value {
	[self setValue: value label: nil];
	return self;
}


- (void)dealloc {
	[label release];
	[textField release];

	[super dealloc];
}

/* OLD stuff showing flex cell with color setting
-(id) setValue:(NSString *) value label:(NSString *)label {
	NSString *valueStr = [[value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] autorelease];
	if (nil != value) {
		if ([valueStr length] != 0) {
			valueLabel.text = [valueStr copy];
			valueLabel.textColor = [UIColor blackColor];
			
			return self;
		}
	}
	valueLabel.text = label;
	valueLabel.textColor = [UIColor grayColor];
	
	return self;
}
*/

@end
