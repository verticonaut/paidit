//
//  SelectionListViewController.h
//  PaidIt
//
//  Created by Martin Schweizer on 04.03.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectionListViewControllerDelegate <NSObject>
	@required
	- (void)rowChosen: (NSInteger)row;
@end

@interface SelectionListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> 
{
    NSArray         *list;
    UITableView     *tableView;
    NSIndexPath     *lastIndexPath;
    NSInteger       initialSelection;
	SEL				propertySelector;
    
    id <SelectionListViewControllerDelegate>    delegate;
}

@property (nonatomic, retain) NSIndexPath *lastIndexPath;
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSArray *list;
@property NSInteger initialSelection;
@property (nonatomic, assign) id <SelectionListViewControllerDelegate> delegate;
@property SEL propertySelector;

@end
