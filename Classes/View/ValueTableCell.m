//
//  ValueTableCell.m
//  PaidIt
//
//  Created by Martin Schweizer on 27.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ValueTableCell.h"


@implementation ValueTableCell

@synthesize valueLabel;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
		CGRect rect = CGRectMake(15.0, 16.0, 250.0, 15.0);
		valueLabel = [[UILabel alloc] initWithFrame: rect];
		valueLabel.font = [UIFont systemFontOfSize: 14];	
		valueLabel.text = @"to be set ...";
		valueLabel.textColor = [UIColor grayColor];
		
		[self.contentView addSubview: valueLabel ];
    }
	
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

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

-(id) setValue:(NSString *) value {
	[self setValue: value label: nil];
	return self;
}


- (void)dealloc {
	[valueLabel release];

	[super dealloc];
}


@end
