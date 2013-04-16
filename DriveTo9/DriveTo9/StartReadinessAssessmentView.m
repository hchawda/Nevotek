//
//  StartReadinessAssessmentView.m
//  DriveTo9
//
//  Created by FxBytes on 06/04/2013.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "StartReadinessAssessmentView.h"
#import "ApplicationMacros.h"
#import "ViewManager.h"
#import "AppDelegate.h"

@implementation StartReadinessAssessmentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth];
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
//    [(UILabel *)[[[[[[self.isOpenUnityConnectionSwitch subviews] lastObject] subviews] objectAtIndex:0] subviews] objectAtIndex:0] setText:@"Yes"];
//    [(UILabel *)[[[[[[self.isOpenUnityConnectionSwitch subviews] lastObject] subviews] objectAtIndex:0] subviews] objectAtIndex:1] setText:@"No"];
    
    self.textFieldRequester.delegate = self;
    self.textFieldPublisher.delegate = self;
    self.textFieldCUCMUserName.delegate = self;
    self.textFieldCUCMPassword.delegate = self;
    self.textFieldIPAddress.delegate = self;
    self.textFieldUUCUserName.delegate = self;
    self.textFieldUUCPassword.delegate = self;
    
    [self.lblHeader setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:24]];
    self.lblHeader.text = @"Start Readiness Assessment";
    
    [self.lblInformation setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:20]];
    self.lblInformation.text = @"Information";
    
    [self.lblOrganizationName setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:14]];
    self.lblOrganizationName.text = @"Organization Name";
    
    [self.lblClusterName setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:14]];
    self.lblClusterName.text = @"Cluster Name";
    
    [self.lblRequesterName setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:14]];
    self.lblRequesterName.text = @"Requester Name";
    
    [self.lblCredentials setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:20]];
    self.lblCredentials.text = @"CUCM Credentials";
    
    [self.lblCredentialsIPAddress setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:14]];
    self.lblCredentialsIPAddress.text = @"Publisher IP Address";
    
    [self.lblCredentialsUserName setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:14]];
    self.lblCredentialsUserName.text = @" OS Admin Username";
    
    [self.lblCredentialsPassword setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:14]];
    self.lblCredentialsPassword.text = @"OS Admin Password";
    
    [self.lblisOpenUnityConnection setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:18]];
    self.lblisOpenUnityConnection.text = @"Unity or Unity Connection?";
    
    [self.lblUnityConnection setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:20]];
    self.lblUnityConnection.text = @"Unity/Unity Connection";
    
    [self.lblUnityConnectionIPAddress setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:14]];
    self.lblUnityConnectionIPAddress.text = @"IP Address";
    
    [self.lblUnityConnectionUserName setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:14]];
    self.lblUnityConnectionUserName.text = @" OS Admin Username";
    
    [self.lblUnityConnectionPassword setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:14]];
    self.lblUnityConnectionPassword.text = @"OS Admin Password";
    
    [self.btnBack.titleLabel setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:12.0]];
    [self.btnBack setTitle:@"Back" forState:UIControlStateNormal];

    [self.btnSubmit.titleLabel setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:20]];
    [self.btnSubmit setTitle:@"Submit" forState:UIControlStateNormal];
    self.btnSubmit.titleLabel.textColor = [UIColor blackColor];
}


/***********************************************************************************************************
 * Method Name							: resetSubViews
 * Description							: Method to reset subviews while UnityConnection is open.
 * @Param								: nil.
 * @return							    : void.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)resetSubViews
{
    int yDiff = 60;
     for (UIView *innerControllerView in [self subviews])
     {
         if ([innerControllerView isKindOfClass:[UIView class]])
         {
             if(innerControllerView.tag == 1)
             {
                 ((UIView *)innerControllerView).frame = CGRectMake(innerControllerView.frame.origin.x, 10 + yDiff, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
             }
             if(innerControllerView.tag == 2)
             {
                 ((UIView *)innerControllerView).frame = CGRectMake(innerControllerView.frame.origin.x, 220 + yDiff, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
             }
             if(innerControllerView.tag == 4)
             {
                 ((UIView *)innerControllerView).frame = CGRectMake(innerControllerView.frame.origin.x, 430 + yDiff, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
             }
         }
         
         if ([innerControllerView isKindOfClass:[UIButton class]])
         {
             if(innerControllerView.tag == 10)
             {
             ((UIButton *)innerControllerView).frame = CGRectMake(innerControllerView.frame.origin.x, 640 + yDiff, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
             }
         }
     }
}

#pragma mark -------Method to set Collapse and Expanding-------
/***********************************************************************************************************
 * Method Name							: expandStartReadinessView
 * Description							: Method to reset subviews while SplitView is collapse.
 * @Param								: nil.
 * @return							    : void.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)expandStartReadinessView
{
    self.btnBack.hidden = NO;
    for (UIView *innerControllerView in [self subviews])
    {
        if ([innerControllerView isKindOfClass:[UIImageView class]])
        {
            if(innerControllerView.tag != 11)
            {
                ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, 1024, innerControllerView.frame.size.height);
            }
            else
            {
                ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, 1024, 55);
            }
        }//if end.
        
        else if ([innerControllerView isKindOfClass:[UIButton class]])
        {
            if(innerControllerView.tag == 10)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(450, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }//else if end.
        
        else if ([innerControllerView isKindOfClass:[UILabel class]])
        {
            if(innerControllerView.tag == 13)
            {
                ((UILabel *)innerControllerView).center = CGPointMake(512, 30);
            }
        }//else if end.
        
        else if ([innerControllerView isKindOfClass:[UIView class]])
        {
            if(innerControllerView.tag == 1) 
            {
                [self expandInformationView];
            }//if end.
            
            else if(innerControllerView.tag == 2)
            {
                [self expandCredentialView];
            }//else if end.
            
            else if(innerControllerView.tag == 4)
            {
                [self expandUnityConnectionView];
            }//else if end.
            
            else if(innerControllerView.tag == 3)
            {
                [self expandIsOpenUnityConnectionView];
            }//else if end.
            
        }   //views else if end. 
    } //for loop ends
}

/***********************************************************************************************************
 * Method Name							: collapseStartReadinessView
 * Description							: Method to reset subviews while SplitView is expand.
 * @Param								: nil.
 * @return							    : void.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)collapseStartReadinessView
{
    self.btnBack.hidden = YES;
    
    for (UIView *innerControllerView in [self subviews])
    {
        if ([innerControllerView isKindOfClass:[UILabel class]])
        {
            if(innerControllerView.tag == 13)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(176, 20, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }
        
        else if ([innerControllerView isKindOfClass:[UIButton class]])
        {
            if(innerControllerView.tag == 10)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(250, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }
        
        else if ([innerControllerView isKindOfClass:[UIView class]])
        {
            if(innerControllerView.tag == 1)
            {
                [self collapseInformationView];
            }
            else if(innerControllerView.tag == 2)
            {
                [self collapseCredentialView];
            }
            
            else if(innerControllerView.tag == 4)             {
                [self collapseUnityConnectionView];
            }
            
            else if(innerControllerView.tag == 3) 
            {
                [self collapseIsOpenUnityConnectionView];
            }
        }
    }

}

/***********************************************************************************************************
 * Method Name							: expandInformationView
 * Description							: Method to reset expandInformationView.
 * @Param								: nil.
 * @return							    : void.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)expandInformationView
{
    self.informationView.frame = CGRectMake(100, self.informationView.frame.origin.y, 800, 199);
    
    for (UIView *informationControllerView in [self.informationView subviews])
    {
        if ([informationControllerView isKindOfClass:[UIImageView class]])
        {
            ((UIImageView *)informationControllerView).frame = CGRectMake(0, 0, 800, 199);
        }
        else if ([informationControllerView isKindOfClass:[UILabel class]])
        {
            ((UILabel *)informationControllerView).frame = CGRectMake(informationControllerView.frame.origin.x, informationControllerView.frame.origin.y, 300, 30);
        }
        else if ([informationControllerView isKindOfClass:[UITextField class]])
        {
            ((UITextField *)informationControllerView).frame = CGRectMake(400, informationControllerView.frame.origin.y, 320, 30);
        }
    }

}

/***********************************************************************************************************
 * Method Name							: expandCredentialView
 * Description							: Method to reset expandCredentialView.
 * @Param								: nil.
 * @return							    : void.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)expandCredentialView
{
    self.credentialsView.frame = CGRectMake(100, self.credentialsView.frame.origin.y, 800, 199);
    
    for (UIView *informationControllerView in [self.credentialsView subviews])
    {
        if ([informationControllerView isKindOfClass:[UIImageView class]])
        {
            ((UIImageView *)informationControllerView).frame = CGRectMake(0, 0, 800, 199);
        }
        else if ([informationControllerView isKindOfClass:[UILabel class]])
        {
            ((UILabel *)informationControllerView).frame = CGRectMake(informationControllerView.frame.origin.x, informationControllerView.frame.origin.y, 300, 30);
        }
        else if ([informationControllerView isKindOfClass:[UITextField class]])
        {
            ((UITextField *)informationControllerView).frame = CGRectMake(400, informationControllerView.frame.origin.y, 320, 30);
        }
    }

}

/***********************************************************************************************************
 * Method Name							: expandUnityConnectionView
 * Description							: Method to reset expandUnityConnectionView.
 * @Param								: nil.
 * @return							    : void.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)expandUnityConnectionView
{
    self.unityConnectionView.frame = CGRectMake(100, self.unityConnectionView.frame.origin.y, 800, 199);
    
    for (UIView *informationControllerView in [self.unityConnectionView subviews])
    {
        if ([informationControllerView isKindOfClass:[UIImageView class]])
        {
            ((UIImageView *)informationControllerView).frame = CGRectMake(0, 0, 800, 199);
        }
        else if ([informationControllerView isKindOfClass:[UILabel class]])
        {
            ((UILabel *)informationControllerView).frame = CGRectMake(informationControllerView.frame.origin.x, informationControllerView.frame.origin.y, 300, 30);
        }
        else if ([informationControllerView isKindOfClass:[UITextField class]])
        {
            ((UITextField *)informationControllerView).frame = CGRectMake(400, informationControllerView.frame.origin.y, 320, 30);
        }
    }

}

 
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
-(void)expandIsOpenUnityConnectionView
{
    self.isOpenUnityConnectionView.frame = CGRectMake(100, self.isOpenUnityConnectionView.frame.origin.y, 800, self.isOpenUnityConnectionView.frame.size.height);
    
    for (UIView *informationControllerView in [self.isOpenUnityConnectionView subviews])
    {
        if ([informationControllerView isKindOfClass:[UIImageView class]])
        {
            ((UIImageView *)informationControllerView).frame = CGRectMake(0, 0, 800, self.isOpenUnityConnectionView.frame.size.height);
        }
        else if ([informationControllerView isKindOfClass:[UILabel class]])
        {
            ((UILabel *)informationControllerView).frame = CGRectMake(informationControllerView.frame.origin.x, informationControllerView.frame.origin.y, 350, 30);
        }
        else if ([informationControllerView isKindOfClass:[UISwitch class]])
        {
            ((UISwitch *)informationControllerView).frame = CGRectMake(700, informationControllerView.frame.origin.y, informationControllerView.frame.size.width, informationControllerView.frame.size.height);
        }
    }

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
-(void)collapseInformationView
{
    self.informationView.frame = CGRectMake(100, self.informationView.frame.origin.y, 422, 193);
    
    for (UIView *informationControllerView in [self.informationView subviews])
    {
        if ([informationControllerView isKindOfClass:[UIImageView class]])
        {
            ((UIImageView *)informationControllerView).frame = CGRectMake(0, 0, 422, 193);
        }
        else if ([informationControllerView isKindOfClass:[UILabel class]])
        {
            ((UILabel *)informationControllerView).frame = CGRectMake(informationControllerView.frame.origin.x, informationControllerView.frame.origin.y, 153, 30);
        }
        else if ([informationControllerView isKindOfClass:[UITextField class]])
        {
            ((UITextField *)informationControllerView).frame = CGRectMake(200, informationControllerView.frame.origin.y, 211, 30);
        }
    }

}

/***********************************************************************************************************
 * Method Name							: collapseCredentialView
 * Description							: Method to reset collapseCredentialView.
 * @Param								: nil.
 * @return							    : void.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)collapseCredentialView
{
    self.credentialsView.frame = CGRectMake(100, self.credentialsView.frame.origin.y, 422, 193);
    
    for (UIView *informationControllerView in [self.credentialsView subviews])
    {
        if ([informationControllerView isKindOfClass:[UIImageView class]])
        {
            ((UIImageView *)informationControllerView).frame = CGRectMake(0, 0, 422, 193);
        }
        else if ([informationControllerView isKindOfClass:[UILabel class]])
        {
            ((UILabel *)informationControllerView).frame = CGRectMake(informationControllerView.frame.origin.x, informationControllerView.frame.origin.y, 200, 30);
        }
        else if ([informationControllerView isKindOfClass:[UITextField class]])
        {
            ((UITextField *)informationControllerView).frame = CGRectMake(200, informationControllerView.frame.origin.y, 211, 30);
        }
    }

}

/***********************************************************************************************************
 * Method Name							: collapseUnityConnectionView
 * Description							: Method to reset collapseUnityConnectionView.
 * @Param								: nil.
 * @return							    : void.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)collapseUnityConnectionView
{
    self.unityConnectionView.frame = CGRectMake(100, self.unityConnectionView.frame.origin.y, 422, 193);
    
    for (UIView *informationControllerView in [self.unityConnectionView subviews])
    {
        if ([informationControllerView isKindOfClass:[UIImageView class]])
        {
            ((UIImageView *)informationControllerView).frame = CGRectMake(0, 0, 422, 193);
        }
        else if ([informationControllerView isKindOfClass:[UILabel class]])
        {
            ((UILabel *)informationControllerView).frame = CGRectMake(informationControllerView.frame.origin.x, informationControllerView.frame.origin.y, 250, 30);
        }
        else if ([informationControllerView isKindOfClass:[UITextField class]])
        {
            ((UITextField *)informationControllerView).frame = CGRectMake(200, informationControllerView.frame.origin.y, 211, 30);
        }
    }
}

/***********************************************************************************************************
 * Method Name							: collapseIsOpenUnityConnectionView
 * Description							: Method to reset collapseIsOpenUnityConnectionView.
 * @Param								: nil.
 * @return							    : void.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)collapseIsOpenUnityConnectionView
{
    self.isOpenUnityConnectionView.frame = CGRectMake(100, self.isOpenUnityConnectionView.frame.origin.y, 422, self.isOpenUnityConnectionView.frame.size.height);
    
    for (UIView *informationControllerView in [self.isOpenUnityConnectionView subviews])
    {
        if ([informationControllerView isKindOfClass:[UIImageView class]])
        {
            ((UIImageView *)informationControllerView).frame = CGRectMake(0, 0, 422, self.isOpenUnityConnectionView.frame.size.height);
        }
        else if ([informationControllerView isKindOfClass:[UILabel class]])
        {
            ((UILabel *)informationControllerView).frame = CGRectMake(informationControllerView.frame.origin.x, informationControllerView.frame.origin.y, 300, 30);
        }
        else if ([informationControllerView isKindOfClass:[UISwitch class]])
        {
            ((UISwitch *)informationControllerView).frame = CGRectMake(330, informationControllerView.frame.origin.y, informationControllerView.frame.size.width, informationControllerView.frame.size.height);
        }
    }

}

#pragma mark -------Action Methods-------
/***********************************************************************************************************
 * Method Name							: openUnityOrUnityConnection:(id)sender
 * Description							: Method to set either UnityConnection View should show or not.
 * @Param								: sender.
 * @return							    : IBAction.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
- (IBAction)openUnityOrUnityConnection:(id)sender {
    
    UISwitch *switchUnityOrUnityConnection = (UISwitch *)sender;
    if(switchUnityOrUnityConnection.on == YES)
    {
        self.isOpenUnityConnectionView.hidden = YES;
        self.unityConnectionView.hidden = NO;
        [self resetSubViews];
    }
}

/***********************************************************************************************************
 * Method Name							: backBtnTapEvent:(id)sender
 * Description							: Method to open Home View.
 * @Param								: sender.
 * @return							    : IBAction.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
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
 * Method Name							: submitBtnTapEvent:(id)sender
 * Description							: Method to save created data.
 * @Param								: sender.
 * @return							    : IBAction.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(IBAction)submitBtnTapEvent:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Under Development." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark - Text View Delegate
//function is called when user begin editing in TextView
- (BOOL)textFieldShouldEndEditing:(UITextField *)txtField {
    if (txtField == self.textFieldRequester) {
        if (isViewUp) {
            CGRect rect = self.frame;
            rect.origin.y += 80;
            self.frame = rect;
            isViewUp = NO;
        } // if
    }
    
    if (txtField == self.textFieldPublisher) {
        if (isViewUp) {
            CGRect rect = self.frame;
            rect.origin.y += 110;
            self.frame = rect;
            isViewUp = NO;
        } // if
    }
    
    if (txtField == self.textFieldCUCMUserName) {
        if (isViewUp) {
            CGRect rect = self.frame;
            rect.origin.y += 110;
            self.frame = rect;
            isViewUp = NO;
        } // if
    }
    
    if (txtField == self.textFieldCUCMPassword) {
        if (isViewUp) {
            CGRect rect = self.frame;
            if(self.isOpenUnityConnectionSwitch.on == NO)
            rect.origin.y += 130;
            else
            rect.origin.y += 220;
            self.frame = rect;
            isViewUp = NO;
        } // if
    }
    
    if (txtField == self.textFieldIPAddress) {
        if (isViewUp) {
            CGRect rect = self.frame;
            rect.origin.y += 220;
            self.frame = rect;
            isViewUp = NO;
        } // if
    }
    
    if (txtField == self.textFieldUUCUserName) {
        if (isViewUp) {
            CGRect rect = self.frame;
            rect.origin.y += 260;
            self.frame = rect;
            isViewUp = NO;
        } // if
    }
    if (txtField == self.textFieldUUCPassword) {
        if (isViewUp) {
            CGRect rect = self.frame;
            rect.origin.y += 270;
            self.frame = rect;
            isViewUp = NO;
        } // if
    }
    
	return YES;
} //textViewShouldEndEditing

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.textFieldRequester) {
        if (!isViewUp) {
            CGRect rect = self.frame;
            rect.origin.y -= 80;
            self.frame = rect;
            isViewUp = YES;
        } // if
    }
    
    if (textField == self.textFieldPublisher) {
        if (!isViewUp) {
            CGRect rect = self.frame;
            rect.origin.y -= 110;
            self.frame = rect;
            isViewUp = YES;
        } // if
    }
    if (textField == self.textFieldCUCMUserName) {
        if (!isViewUp) {
            CGRect rect = self.frame;
            rect.origin.y -= 110;
            self.frame = rect;
            isViewUp = YES;
        } // if
    }
    if (textField == self.textFieldCUCMPassword) {
        if (!isViewUp) {
            CGRect rect = self.frame;
            if(self.isOpenUnityConnectionSwitch.on == NO)
                rect.origin.y -= 130;
            else
                rect.origin.y -= 220;
//            rect.origin.y -= 130;
            self.frame = rect;
            isViewUp = YES;
        } // if
    }
    if (textField == self.textFieldIPAddress) {
        if (!isViewUp) {
            CGRect rect = self.frame;
            rect.origin.y -= 220;
            self.frame = rect;
            isViewUp = YES;
        } // if
    }
    if (textField == self.textFieldUUCUserName) {
        if (!isViewUp) {
            CGRect rect = self.frame;
            rect.origin.y -= 260;
            self.frame = rect;
            isViewUp = YES;
        } // if
    }
    if (textField == self.textFieldUUCPassword) {
        if (!isViewUp) {
            CGRect rect = self.frame;
            rect.origin.y -= 270;
            self.frame = rect;
            isViewUp = YES;
        } // if
    }
    
}

#pragma Mark - Text field resign methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

- (void)viewDidUnload {
    [self setInformationView:nil];
    [self setCredentialsView:nil];
    [self setInformationImageView:nil];
    [self setCredentialsImageView:nil];
    [self setLblInformation:nil];
    [self setLblClusterName:nil];
    [self setLblOrganizationName:nil];
    [self setLblClusterName:nil];
    [self setLblRequesterName:nil];
    [self setLblCredentials:nil];
}

@end
