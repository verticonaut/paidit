//
//  SelectionListViewController.m
//  PaidIt
//
//  Created by Jeff LaMarche on 2/18/09.
//  Modified by Martin Schweizer
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SelectionListViewController.h"

@implementation SelectionListViewController

@synthesize list;
@synthesize tableView;
@synthesize lastIndexPath;
@synthesize initialSelection;
@synthesize delegate;
@synthesize propertySelector;
@synthesize indexTag;

-(IBAction)cancel
{
	[self dismissModalViewControllerAnimated: TRUE];
	// [self.delegate dismissModalViewControllerAnimated: TRUE];
}
-(IBAction)save
{
    [self.delegate rowChosen:[lastIndexPath row] indexTag: indexTag ];
	[self dismissModalViewControllerAnimated: TRUE];
	// [self.delegate dismissModalViewControllerAnimated: TRUE];
}

#pragma mark -
- (id)initWithStyle:(UITableViewStyle)style
{
    initialSelection = -1;
    return self;
}

- (void)loadView
{
    UIView *theView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = theView;
    [theView release];
	
	// NEW
	UINavigationBar *navBar;
	navBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
	UINavigationItem *navItem; 
	navItem = [ [ UINavigationItem alloc ] initWithTitle:@"Select Element" ];
	[navBar pushNavigationItem: navItem];
	[self.view addSubview: navBar];
	[navBar release];
	// NEW END
	
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
	[navItem release];

	UITableView *theTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 44.0, 320.0, 480.0) style:UITableViewStyleGrouped];
    theTableView.delegate = self;
    theTableView.dataSource = self;
    [self.view addSubview:theTableView];
    self.tableView = theTableView;
    [theTableView release];
	
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
}

- (void)viewWillAppear:(BOOL)animated 
{
    // Check to see if user has indicated a row to be selected, and set it
    if (initialSelection > - 1 && initialSelection < [list count])
    {
        NSUInteger newIndex[] = {0, initialSelection};
        NSIndexPath *newPath = [[NSIndexPath alloc] initWithIndexes:newIndex length:2];
        self.lastIndexPath = newPath;
        [newPath release];
    }
        
    [super viewWillAppear: animated];
}

- (void)dealloc 
{
    [list release];
    [lastIndexPath release];

    [super dealloc];
}

#pragma mark -
#pragma mark Tableview methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *SelectionListCellIdentifier = @"SelectionListCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SelectionListCellIdentifier];
    if (cell == nil) 
    {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:SelectionListCellIdentifier] autorelease];
    }
    
    NSUInteger row = [indexPath row];
    NSUInteger oldRow = [lastIndexPath row];
	NSObject *obj = [list objectAtIndex: row];
	if (nil == propertySelector) {
		cell.text = obj;
	} else {
		cell.text = [obj performSelector: propertySelector];
	}
    cell.accessoryType = (row == oldRow && lastIndexPath != nil) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    int newRow = [indexPath row];
    int oldRow = [lastIndexPath row];
    
    if (newRow != oldRow)
    {
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath: lastIndexPath]; 
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        
        lastIndexPath = indexPath;  
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
