//
//  StartReadinessAssessmentView.h
//  DriveTo9
//
//  Created by FxBytes on 06/04/2013.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartReadinessAssessmentView : UIView <UITextFieldDelegate>
{
    BOOL isViewUp;
}


@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;


@property (weak, nonatomic) IBOutlet UIView *informationView;
@property (weak, nonatomic) IBOutlet UIView *credentialsView;
@property (weak, nonatomic) IBOutlet UIView *unityConnectionView;
@property (weak, nonatomic) IBOutlet UIView *isOpenUnityConnectionView;


@property (weak, nonatomic) IBOutlet UIImageView *informationImageView;
@property (weak, nonatomic) IBOutlet UIImageView *credentialsImageView;
@property (weak, nonatomic) IBOutlet UIImageView *unityConnectionImageView;
@property (weak, nonatomic) IBOutlet UIImageView *isOpenUnityConnectionImageView;


@property (weak, nonatomic) IBOutlet UILabel *lblHeader;
@property (weak, nonatomic) IBOutlet UILabel *lblInformation;
@property (weak, nonatomic) IBOutlet UILabel *lblOrganizationName;
@property (weak, nonatomic) IBOutlet UILabel *lblClusterName;
@property (weak, nonatomic) IBOutlet UILabel *lblRequesterName;
@property (weak, nonatomic) IBOutlet UILabel *lblCredentials;
@property (weak, nonatomic) IBOutlet UILabel *lblCredentialsIPAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblCredentialsUserName;
@property (weak, nonatomic) IBOutlet UILabel *lblCredentialsPassword;
@property (weak, nonatomic) IBOutlet UILabel *lblisOpenUnityConnection;
@property (weak, nonatomic) IBOutlet UILabel *lblUnityConnection;
@property (weak, nonatomic) IBOutlet UILabel *lblUnityConnectionIPAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblUnityConnectionUserName;
@property (weak, nonatomic) IBOutlet UILabel *lblUnityConnectionPassword;

@property (weak, nonatomic) IBOutlet UISwitch *isOpenUnityConnectionSwitch;


@property (strong, nonatomic) IBOutlet UITextField *textFieldOrganization;
@property (strong, nonatomic) IBOutlet UITextField *textFieldCluster;
@property (strong, nonatomic) IBOutlet UITextField *textFieldRequester;
@property (strong, nonatomic) IBOutlet UITextField *textFieldPublisher;
@property (strong, nonatomic) IBOutlet UITextField *textFieldCUCMUserName;
@property (strong, nonatomic) IBOutlet UITextField *textFieldCUCMPassword;
@property (strong, nonatomic) IBOutlet UITextField *textFieldIPAddress;
@property (strong, nonatomic) IBOutlet UITextField *textFieldUUCUserName;
@property (strong, nonatomic) IBOutlet UITextField *textFieldUUCPassword;

//Method to set labels of each in StartReadinessAssessmentView.
-(void)setViewControllers;

//Method to reset frame controllers of StartReadinessAssessmentView when user set UnityConnectionSwitch.
-(void)resetSubViews;

//Method to open UnityConnection view.
-(IBAction)openUnityOrUnityConnection:(id)sender;

//Method to Home View.
-(IBAction)backBtnTapEvent:(id)sender;

-(IBAction)submitBtnTapEvent:(id)sender;

-(void)expandStartReadinessView;
-(void)collapseStartReadinessView;

@end
