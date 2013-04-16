//
//  PDFViewController.m
//  DriveTo9
//
//  Created by Vipin Dhangar on 4/15/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "PDFViewController.h"
#import "AppDelegate.h"
#import "ApplicationMacros.h"
#import "UpgradeReadinessAssessmentViewController.h"

@interface PDFViewController ()

@end

@implementation PDFViewController

@synthesize strPdfName;

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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -------Action Methods-------
/***********************************************************************************************************
 * Method Name							: btnTappedForPdf:(UIButton *)btn
 * Description							: Method to open PopUp and to load respective pdf.
 * @Param								: (UIButton *)btn.
 * @return							    : void.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013							FXBytes									Created
 ***********************************************************************************************************/
- (void)btnTappedForPdf:(UIButton *)btn {
    
    self.strPdfName = btn.titleLabel.text;
    
    self.lblTitle.text = self.strPdfName;
    [self.lblTitle setTextColor:[UIColor whiteColor]];
    [self.lblTitle setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:28.0]];
    
    NSURL *fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Org1-Cluster2-Assessment (2)" ofType:@"pdf"]];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:fileURL];
    [self.webVwPdf loadRequest:requestObj];
}


/***********************************************************************************************************
 * Method Name							: backBtnTapEvent
 * Description							: Method to open Home View.
 * @Param								: sender.
 * @return							    : IBAction.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013							FXBytes									Created
 ***********************************************************************************************************/
#pragma mark - back button
- (void)backBtnTapped {
	ViewManager *manager = [((AppDelegate*)[UIApplication sharedApplication].delegate) manager];
	if([manager canSwitchToViewWithId:UPGRADEREADINESSASSESSMENTVIEWCONTROLLER])
	{
		[manager switchToViewWithId:UPGRADEREADINESSASSESSMENTVIEWCONTROLLER];
        UpgradeReadinessAssessmentViewController *viewConroller = (UpgradeReadinessAssessmentViewController *)[manager activeViewController];
        [viewConroller sectionRowTapped:@"0" withSection:@"1"];
	}
}

- (void)viewDidUnload {
    [self setLblTitle:nil];
    [super viewDidUnload];
}
@end
