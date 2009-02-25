//
//  PaymentCell.m
//  PaidIt
//
//  Created by Martin Schweizer on 23.02.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PaymentCell.h"


@implementation PaymentCell

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}


@end
