//
//  UpgradeProceduresView.m
//  DriveTo9
//
//  Created by Rahul Soni on 4/12/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "UpgradeProceduresView.h"
#import "ApplicationMacros.h"
#import "ViewManager.h"
#import "AppDelegate.h"

@implementation UpgradeProceduresView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark -------Method to set controllers while loading-------
/***********************************************************************************************************
 * Method Name							: setViewControllers
 * Description							: Method to set controllers of SummaryViewController.
 * @Param								: nil.
 * @return							    : void
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)setViewControllers
{
    [self.lblHeader setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:24]];
    self.lblHeader.text = @"Upgrade Procedures";
    
    [self.btnBack.titleLabel setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:12.0]];
    [self.btnBack setTitle:@"Back" forState:UIControlStateNormal];
    
    [self.btnDirectUpgrade.titleLabel setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTREGULAR size:16.0]];
//    [self.btnDirectUpgrade setTitle:@"Direct Upgrade Procedure" forState:UIControlStateNormal];
    
    [self.btnHighAvailabilityUpgrade.titleLabel setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTREGULAR size:16.0]];
//    [self.btnHighAvailabilityUpgrade setTitle:@"High Availability Upgrade Procedure" forState:UIControlStateNormal];
    
    [self.btnBridgedUpgrade.titleLabel setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTREGULAR size:16.0]];
//    [self.btnBridgedUpgrade setTitle:@"Bridged Upgrade Procedure" forState:UIControlStateNormal];
}

#pragma mark -------Method to set Collapse and Expanding------- 
/***********************************************************************************************************
 * Method Name							: expandIsOpenUnityConnectionView
 * Description							: Method to reset expandUnityConnectionView.
 * @Param								: nil.
 * @return							    : void.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)expandUpgradeProceduresView
{
    self.btnBack.hidden = NO;
    for (UIView *innerControllerView in [self subviews])
    {
        if ([innerControllerView isKindOfClass:[UIButton class]])
        {
            if(innerControllerView.tag == 53)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(20, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 54)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(300, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 55)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(300, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 56)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(300, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            
        }//else if end.
        
        else if ([innerControllerView isKindOfClass:[UILabel class]])
        {
            if(innerControllerView.tag == 57)
            {
                ((UILabel *)innerControllerView).center = CGPointMake(512, 30);
            }
        }//else if end.
        
        else if ([innerControllerView isKindOfClass:[UIImageView class]])
        {
            if(innerControllerView.tag == 58 || innerControllerView.tag == 59 || innerControllerView.tag == 60)
            {
                ((UIImageView *)innerControllerView).frame = CGRectMake(330, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }
        
    } //for loop ends
}

/***********************************************************************************************************
 * Method Name							: collapseInformationView
 * Description							: Method to reset collapseInformationView.
 * @Param								: nil.
 * @return							    : void.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)collapseUpgradeProceduresView
{
    self.btnBack.hidden = YES;
    
    for (UIView *innerControllerView in [self subviews])
    {
        
        if ([innerControllerView isKindOfClass:[UILabel class]])
        {
            if(innerControllerView.tag == 57)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(176, 20, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }
        
        else if ([innerControllerView isKindOfClass:[UIButton class]])
        {
            if(innerControllerView.tag == 53)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(20, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 54)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(145, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 55)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(145, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 56)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(145, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }
        
        else if ([innerControllerView isKindOfClass:[UIImageView class]])
        {
            if(innerControllerView.tag == 58 || innerControllerView.tag == 59 || innerControllerView.tag == 60)
            {
                ((UIImageView *)innerControllerView).frame = CGRectMake(175, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }
        
    }
}

#pragma mark -------Action Methods-------
/***********************************************************************************************************
 * Method Name							: backBtnTapEvent:(id)sender
 * Description							: Method to open Home View.
 * @Param								: sender.
 * @return							    : IBAction.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(IBAction)backBtnTapEvent:(id)sender
{
    ViewManager *manager = [((AppDelegate*)[UIApplication sharedApplication].delegate) manager];
	if([manager canSwitchToViewWithId:HOMEVIEWCONTROLLER])
	{
		[manager switchToViewWithId:HOMEVIEWCONTROLLER];
	}
}

/***********************************************************************************************************
 * Method Name							: directUpgradeBtnTapEvent:(id)sender
 * Description							: Method to DirectUpgradeProcedure View.
 * @Param								: sender.
 * @return							    : IBAction.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(IBAction)directUpgradeBtnTapEvent:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Under Development." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];

}

/***********************************************************************************************************
 * Method Name							: HighAvailabilityUpgradeBtnTapEvent:(id)sender
 * Description							: Method to HighAvailabilityUpgrade View.
 * @Param								: sender.
 * @return							    : IBAction.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(IBAction)highAvailabilityUpgradeBtnTapEvent:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Under Development." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];

}

/***********************************************************************************************************
 * Method Name							: bridgedUpgradeBtnTapEvent:(id)sender
 * Description							: Method to BridgedUpgradeProcedure View.
 * @Param								: sender.
 * @return							    : IBAction.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(IBAction)bridgedUpgradeBtnTapEvent:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Under Development." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];

}

@end
