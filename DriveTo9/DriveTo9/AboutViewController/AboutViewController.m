//
//  AboutViewController.m
//  DriveTo9
//
//  Created by Vipin Dhangar on 4/10/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "AboutViewController.h"
#import "MyAssessmentView.h"
#import "AppDelegate.h"
#import "SplitView.h"
#import "ApplicationMacros.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

@synthesize arrAbout;
@synthesize strFontName;
@synthesize lblAllRights;
@synthesize topNavigationBar;
@synthesize lblCucmUpgarde;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //set this view controller to actvate view controller
	ViewManager *manager = [((AppDelegate*)[UIApplication sharedApplication].delegate) manager];
	[manager setActiveViewController:self];
    
    [self.topNavigationBar setBackgroundImage:[UIImage imageNamed:@"NavBarBG.png"] forBarMetrics:UIBarMetricsDefault];
    
    UIView *vwBarBtn = [[UIView alloc] initWithFrame:CGRectMake(10, 2, 50, 31)];
    [vwBarBtn setBackgroundColor:[UIColor clearColor]];
    [self.topNavigationBar addSubview:vwBarBtn];
    
    UIButton *backBarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBarBtn.frame = CGRectMake(0, 5, 50, 31);
    [backBarBtn setImage:[UIImage imageNamed:@"backbuttonbg.png"] forState:UIControlStateNormal];
    [backBarBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backBarBtn addTarget:self action:@selector(backBtnTapped) forControlEvents:UIControlEventTouchUpInside];
    [vwBarBtn addSubview:backBarBtn];
    
    UILabel *lblBack = [[UILabel alloc] initWithFrame:CGRectMake(12, 3, 50, 31)];
    lblBack.text = @"Back";
    lblBack.backgroundColor = [UIColor clearColor];
    [lblBack setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:12.0]];
    lblBack.textColor = [UIColor whiteColor];
    [vwBarBtn addSubview:lblBack];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:(float)230/255 green:(float)230/255 blue:(float)230/255 alpha:1.0]];
    
    self.arrAbout = [NSArray arrayWithObjects:@"Term of Use",@"Privacy Policy", nil];
    
    strFontName = @"";
    
    self.strFontName = FONTNAME_HELVETICANEUEBOLD;
    
    [self.lblCucmUpgarde setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:30.0]];
    [self.lblCucmUpgarde setTextColor:[UIColor colorWithRed:(float)64/255 green:(float)64/255 blue:(float)64/255 alpha:1.0]];
    
    [self.lblAllRights setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:14.0]];
    [self.lblAllRights setTextColor:[UIColor colorWithRed:(float)64/255 green:(float)64/255 blue:(float)64/255 alpha:1.0]];
    
    [self.tableView reloadData];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setBounces:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}

/***********************************************************************************************************
 * Method Name							: backBtnTapEvent
 * Description							: Method to open Homeview.
 * @Param								: (id)sender.
 * @return                              : IBAction
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
#pragma mark - back button
- (void)backBtnTapped {
	ViewManager *manager = [((AppDelegate*)[UIApplication sharedApplication].delegate) manager];
	if([manager canSwitchToViewWithId:HOMEVIEWCONTROLLER])
	{
		[manager switchToViewWithId:HOMEVIEWCONTROLLER];
	}
}

#pragma mark Table view data source and delegate.
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrAbout count];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = nil;
    
	if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	}
    
    cell.textLabel.text = [self.arrAbout objectAtIndex:indexPath.row];
    [cell.textLabel setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:17.0]];
    return cell;
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
