//
//  DateViewController.m
//  PaidIt
//
//  Created by Martin Schweizer on 04.03.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DateViewController.h"

@implementation DateViewController
@synthesize datePicker;
@synthesize dateTableView;
@synthesize date;
@synthesize delegate;

-(IBAction)dateChanged
{
    self.date = [datePicker date];
    [dateTableView reloadData];
}
-(IBAction)cancel
{
    [self.delegate dismissModalViewControllerAnimated: TRUE];
}
-(IBAction)save
{
    [self.delegate takeNewDate:date];
    [self.delegate dismissModalViewControllerAnimated: TRUE];
}
- (void)loadView
{
    UIView *theView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = theView;
    [theView release];
	
	// NEW
	UINavigationBar *navBar;
	navBar = [[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)] autorelease];
	UINavigationItem *navItem; 
	navItem = [[[UINavigationItem alloc] initWithTitle:@"Select Date" ] autorelease];
	[navBar pushNavigationItem: navItem];
	[self.view addSubview: navBar];
	// NEW END

    UITableView *theTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 107.0, 320.0, 480.0) style:UITableViewStyleGrouped];
    theTableView.delegate = self;
    theTableView.dataSource = self;
    [self.view addSubview:theTableView];
    self.dateTableView = theTableView;
    [theTableView release];
    
    UIDatePicker *theDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0.0, 245.0, 320.0, 216.0)];
    theDatePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker = theDatePicker;
    [theDatePicker release];
    [datePicker addTarget:self action:@selector(dateChanged) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
	
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]
                                     initWithTitle:NSLocalizedString(@"Cancel", @"Cancel - for button to cancel changes")
                                     style:UIBarButtonItemStylePlain
                                     target:self
                                     action:@selector(cancel)];
	navItem.leftBarButtonItem = cancelButton;
    [cancelButton release];
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
                                   initWithTitle:NSLocalizedString(@"Select", @"Select - for button to take over changes")
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(save)];
    navItem.rightBarButtonItem = saveButton;
    [saveButton release];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    if (self.date != nil)
        [self.datePicker setDate:date animated:YES];
    else 
        [self.datePicker setDate:[NSDate date] animated:YES];
    
    [super viewWillAppear: animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc 
{
    [datePicker release];
    [dateTableView release];
    [date release];
    [super dealloc];
}
#pragma mark -
#pragma mark Table View Methods
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *DateCellIdentifier = @"DateCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DateCellIdentifier];
    if (cell == nil) 
    {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:DateCellIdentifier] autorelease];
        cell.font = [UIFont systemFontOfSize:17.0];
        cell.textColor = [UIColor colorWithRed:0.243 green:0.306 blue:0.435 alpha:1.0];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMMM dd, yyyy"];
    cell.text = [formatter stringFromDate: date];
    [formatter release];
	
    [datePicker setDate: date animated: TRUE];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;   
}
@end
