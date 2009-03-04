//
//  DateViewController.h
//  PaidIt
//
//  Created by Martin Schweizer on 04.03.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DateViewDelegate <NSObject>
@required
- (void)takeNewDate:(NSDate *)newDate;
@end

@interface DateViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    UIDatePicker            *datePicker;
    UITableView             *dateTableView;
    NSDate                  *date;
    
    id <DateViewDelegate>   delegate;   // weak ref
}
@property (nonatomic, retain) UIDatePicker *datePicker;
@property (nonatomic, retain) UITableView *dateTableView;
@property (nonatomic, retain) NSDate *date;
@property (nonatomic, assign)  id <DateViewDelegate> delegate;
-(IBAction)dateChanged;
@end