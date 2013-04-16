//
//  HomeViewController.m
//  DriveTo9
//
//  Created by FxBytes on 05/04/2013.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "ApplicationMacros.h"

@interface HomeViewController ()

@property (nonatomic,weak) IBOutlet UIButton *btnUpgradeReadinessAssessment;
@property (nonatomic,weak) IBOutlet UIButton *btnUpgradeCollateral;
@property (nonatomic,weak) IBOutlet UIButton *btnUpgradeSupportServices;

// button click events
- (IBAction)openUpgradeReadinessAssessmentViewController:(id)sender;
- (IBAction)openUpgradeCollateralViewController:(id)sender;
- (IBAction)openUpgradeSupportServicesViewController:(id)sender;

@end

@implementation HomeViewController

@synthesize topNavigationBar;
@synthesize lblURA;
@synthesize lblUC;
@synthesize lblUSS;

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
	    
    [self.topNavigationBar setBackgroundImage:[UIImage imageNamed:@"NavBarBG.png"] forBarMetrics:UIBarMetricsDefault];
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1024, 50)];
    navLabel.text = @"CUCM Upgrade Central";
    navLabel.backgroundColor = [UIColor clearColor];
    navLabel.textColor = [UIColor whiteColor];
    [navLabel setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:24.0]];
    navLabel.textAlignment = UITextAlignmentCenter;
    self.topNavigationBar.topItem.titleView= navLabel;
    
    UIView *vwBarBtn = [[UIView alloc] initWithFrame:CGRectMake(965, 0, 50, 31)];
    [vwBarBtn setBackgroundColor:[UIColor clearColor]];
    vwBarBtn.tag = 1111;
    [self.topNavigationBar addSubview:vwBarBtn];
    
    UIButton *aboutBarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    aboutBarBtn.frame = CGRectMake(0, 5, 50, 31);
    [aboutBarBtn setImage:[UIImage imageNamed:@"GreenButtonBG.png"] forState:UIControlStateNormal];
    [aboutBarBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [aboutBarBtn addTarget:self action:@selector(aboutBtnTapped) forControlEvents:UIControlEventTouchUpInside];
    [vwBarBtn addSubview:aboutBarBtn];
    
    UILabel *lblAbout = [[UILabel alloc] initWithFrame:CGRectMake(7, 5, 50, 31)];
    lblAbout.text = @"About";
    lblAbout.backgroundColor = [UIColor clearColor];
    [lblAbout setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:12.0]];
    lblAbout.textColor = [UIColor whiteColor];
    [vwBarBtn addSubview:lblAbout];
    
    [self.lblURA setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTTHIN size:24.0]];
    [self.lblUC setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTTHIN size:24.0]];
    [self.lblUSS setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTTHIN size:24.0]];
    
	//here we check which view controllers button will be enable.
	ViewManager *manager = [((AppDelegate*)[UIApplication sharedApplication].delegate) manager];
	if(![manager canSwitchToViewWithId:UPGRADEREADINESSASSESSMENTVIEWCONTROLLER])
	{
		[self.btnUpgradeReadinessAssessment setEnabled:NO];
	}
	if(![manager canSwitchToViewWithId:UPGRADECOLLATERALVIEWCONTROLLER])
	{
		[self.btnUpgradeCollateral setEnabled:NO];
	}
	if(![manager canSwitchToViewWithId:UPGRADESUPPORTSERVICESVIEWCONTROLLER])
	{
		[self.btnUpgradeSupportServices setEnabled:NO];
	}
	
	//set this view controller to actvate view controller
	[manager setActiveViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ---- buttons delegate ----
/***********************************************************************************************************
 * Method Name							: openUpgradeReadinessAssessmentViewController:(id)sender
 * Description							: Method to open UpgradeReadinessAssessment View.
 * @Param								: (id)sender.
 * @return                              : IBAction
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
- (IBAction)openUpgradeReadinessAssessmentViewController:(id)sender
{
	//You can change the content id here to see our algo effect.
	ViewManager *manager = [((AppDelegate*)[UIApplication sharedApplication].delegate) manager];
	if([manager canSwitchToViewWithId:UPGRADEREADINESSASSESSMENTVIEWCONTROLLER])
	{
		[manager switchToViewWithId:UPGRADEREADINESSASSESSMENTVIEWCONTROLLER contentId:@"1"];
	}
}

/***********************************************************************************************************
 * Method Name							: openUpgradeCollateralViewController:(id)sender
 * Description							: Method to open UpgradeCollateral View.
 * @Param								: (id)sender.
 * @return                              : IBAction
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
- (IBAction)openUpgradeCollateralViewController:(id)sender
{
	ViewManager *manager = [((AppDelegate*)[UIApplication sharedApplication].delegate) manager];
	if([manager canSwitchToViewWithId:UPGRADECOLLATERALVIEWCONTROLLER])
	{
		[manager switchToViewWithId:UPGRADECOLLATERALVIEWCONTROLLER contentId:@"1"];
	}
}

/***********************************************************************************************************
 * Method Name							: openUpgradeSupportServicesViewController:(id)sender
 * Description							: Method to open UpgradeSupportServices View.
 * @Param								: (id)sender.
 * @return                              : IBAction
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
- (IBAction)openUpgradeSupportServicesViewController:(id)sender
{
	ViewManager *manager = [((AppDelegate*)[UIApplication sharedApplication].delegate) manager];
	if([manager canSwitchToViewWithId:UPGRADESUPPORTSERVICESVIEWCONTROLLER])
	{
		[manager switchToViewWithId:UPGRADESUPPORTSERVICESVIEWCONTROLLER contentId:@"1"];
	}
}

/***********************************************************************************************************
 * Method Name							: aboutBtnTapped
 * Description							: Method to open About View.
 * @Param								: void.
 * @return                              : void
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
- (void)aboutBtnTapped
{
	ViewManager *manager = [((AppDelegate*)[UIApplication sharedApplication].delegate) manager];
	if([manager canSwitchToViewWithId:ABOUTVIEWCONTROLLER])
	{
		[manager switchToViewWithId:ABOUTVIEWCONTROLLER contentId:@"1"];
	}
}

- (void)viewDidUnload {
    [self setTopNavigationBar:nil];
    [self setLblURA:nil];
    [self setLblUC:nil];
    [self setLblUSS:nil];
    [super viewDidUnload];
}

@end
