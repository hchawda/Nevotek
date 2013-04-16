//
//  MyAssessmentView.m
//  DriveTo9
//
//  Created by FxBytes on 06/04/2013.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "MyAssessmentView.h"
#import "ApplicationMacros.h"
#import "ViewManager.h"
#import "AppDelegate.h"

@implementation MyAssessmentView

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
 * Description							: Method to set controllers of StartReadinessAssessmentView.
 * @Param								: nil.
 * @return							    : void
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)setViewControllers
{
    [self.lblHeaderTitle setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:24]];
    self.lblHeaderTitle.text = @"My Assessment";
    
    [self.btnBack.titleLabel setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:12.0]];
    [self.btnBack setTitle:@"Back" forState:UIControlStateNormal];
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
-(void)expandMyAssessmentView
{
    self.btnBack.hidden = NO;
    for (UIView *innerControllerView in [self subviews])
    {
        if ([innerControllerView isKindOfClass:[UIImageView class]])
        {
            if(innerControllerView.tag == 35)
            {
                ((UIImageView *)innerControllerView).frame = CGRectMake(400, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
             
        }//if end.
        
        else if ([innerControllerView isKindOfClass:[UIButton class]])
        {
            if(innerControllerView.tag == 36)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(20, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            
        }//else if end.
        
        else if ([innerControllerView isKindOfClass:[UILabel class]])
        {
            if(innerControllerView.tag == 33)
            {
                ((UILabel *)innerControllerView).center = CGPointMake(512, 30);
            }
            if(innerControllerView.tag == 34)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(400, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }//else if end.
        
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
-(void)collapseMyAssessmentView
{
    self.btnBack.hidden = YES;
    
    for (UIView *innerControllerView in [self subviews])
    {
        if ([innerControllerView isKindOfClass:[UIImageView class]])
        {
            if(innerControllerView.tag == 35)
            {
                ((UIImageView *)innerControllerView).frame = CGRectMake(242, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            
        }//if end.
        
        if ([innerControllerView isKindOfClass:[UILabel class]])
        {
            if(innerControllerView.tag == 33)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(176, 20, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 34)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(241, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }

        }
        
        else if ([innerControllerView isKindOfClass:[UIButton class]])
        {
            if(innerControllerView.tag == 36)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(20, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
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

@end
