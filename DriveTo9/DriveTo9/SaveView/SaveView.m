//
//  SaveView.m
//  DriveTo9
//
//  Created by FxBytes on 15/04/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "SaveView.h"
#import "ApplicationMacros.h"
#import "ViewManager.h"
#import "AppDelegate.h"

@implementation SaveView

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
    [self.lblSave setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:20]];
    self.lblSave.text = @"Save";
    
    [self.lblReportName setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:17]];
    self.lblReportName.text = @"Report Name";
    
    [self.btnCancel.titleLabel setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:12.0]];
    [self.btnCancel setTitle:@"Cancel" forState:UIControlStateNormal];
    
    [self.btnSaveConfirm.titleLabel setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:20.0]];
    [self.btnSaveConfirm setTitle:@"Save" forState:UIControlStateNormal];
    
    [self.btnCancel addTarget:nil action:@selector(cancelBtnTapped) forControlEvents:UIControlEventTouchUpInside];

    self.txtFieldReportName.text = @"My Report";
    self.txtFieldReportName.delegate = self;
    [self.txtFieldReportName setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUELIGHT size:16.0]];
}

/***********************************************************************************************************
 * Method Name							: saveConfirmBtnTapEvent:(id)sender
 * Description							: Method to save all contents by specific report name.
 * @Param								: sender as id.
 * @return                              : void
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(IBAction)saveConfirmBtnTapEvent:(id)sender
{
    [self.txtFieldReportName resignFirstResponder];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Under Development." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark - TextField Delegate's Method.
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if([self.txtFieldReportName.text isEqualToString:@"My Report"])
    {
        self.txtFieldReportName.text = @"";
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.txtFieldReportName resignFirstResponder];
    if([self.txtFieldReportName.text isEqualToString:@""])
    {
        self.txtFieldReportName.text = @"My Report";
    }
}

@end
