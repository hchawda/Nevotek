//
//  MyAssessmentPDFView.m
//  DriveTo9
//
//  Created by Vipin Dhangar on 4/11/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "MyAssessmentPDFView.h"
#import "ApplicationMacros.h"
#import "ViewManager.h"
#import "AppDelegate.h"

@implementation MyAssessmentPDFView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
     }
    return self;
}

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
-(void)setViewControllers:(NSURL *)pdfUrl {
    [self.btnEmail addTarget:nil action:@selector(emailBtnTapped) forControlEvents:UIControlEventTouchUpInside];
                                                  
  [self.lblHeaderTitle setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:24]];
  self.lblHeaderTitle.text = @"My Assessment";
  
  NSURLRequest *requestObj = [NSURLRequest requestWithURL:pdfUrl];
  [self.webViewPdf loadRequest:requestObj];
    
    [self.btnBack.titleLabel setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:12.0]];
    [self.btnBack setTitle:@"Back" forState:UIControlStateNormal];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

/***********************************************************************************************************
 * Method Name							: -(IBAction)deleteBtnTapped:(id)sender
 * Description							: Method to delete the pdf
 * @Param								: nil.
 * @return							    : void
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(IBAction)deleteBtnTapped:(id)sender {
  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Are you sure, you want to delete this pdf?" delegate:nil cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
  [alertView show];
}

/***********************************************************************************************************
 * Method Name							: -(IBAction)shareBtnTapped:(id)sender
 * Description							: Method to to open the share options
 * @Param								: nil.
 * @return							    : void
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(IBAction)shareBtnTapped:(id)sender {
  
  if (!self.vwPopUp.hidden) {
    self.vwPopUp.hidden = YES;
  } else {
    self.vwPopUp.hidden = NO;
  }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  self.vwPopUp.hidden = YES;
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
-(void)expandMyAssessmentPDFViewView
{
    self.btnBack.hidden = NO;
    for (UIView *innerControllerView in [self subviews])
    {
                
        if ([innerControllerView isKindOfClass:[UIButton class]])
        {
            if(innerControllerView.tag == 77)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(20, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }//else if end.
        
        else if ([innerControllerView isKindOfClass:[UILabel class]])
        {
            if(innerControllerView.tag == 76)
            {
                ((UILabel *)innerControllerView).center = CGPointMake(512, 30);
            }
        }//else if end.
        
        else if ([innerControllerView isKindOfClass:[UIView class]])
        {
            if(innerControllerView.tag == 73)
            {
                ((UIView *)innerControllerView).frame = CGRectMake(777, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            
            if(innerControllerView.tag == 75)
            {
                ((UIView *)innerControllerView).frame = CGRectMake(771, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            
        }//if end.
        
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
-(void)collapseMyAssessmentPDFViewView
{
    self.btnBack.hidden = YES;
    
    for (UIView *innerControllerView in [self subviews])
    {
        
        if ([innerControllerView isKindOfClass:[UILabel class]])
        {
            if(innerControllerView.tag == 76)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(176, 20, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }
        
        else if ([innerControllerView isKindOfClass:[UIButton class]])
        {
            if(innerControllerView.tag == 77)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(20, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }
        
        else if ([innerControllerView isKindOfClass:[UIView class]])
        {
            if(innerControllerView.tag == 73)
            {
                ((UIView *)innerControllerView).frame = CGRectMake(477, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 75)
            {
                ((UIView *)innerControllerView).frame = CGRectMake(471, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            
        }//if end.
        
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
