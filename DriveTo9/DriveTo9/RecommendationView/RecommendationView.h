//
//  RecommendationView.h
//  DriveTo9
//
//  Created by Rahul Soni on 4/12/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVSSHDataMiner.h"
#import "NVCUCMCluster.h"

@interface RecommendationView : UIView
{
}

@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet UIButton *btnAction;

@property (weak, nonatomic) IBOutlet UILabel *lblHeader;

@property (weak, nonatomic) IBOutlet UIView *vwPopUp;

@property (nonatomic, strong) IBOutlet UIButton *btnEmail;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;

@property (strong, nonatomic) UIScrollView *scrollVwRecommendation;
@property (strong, nonatomic) IBOutlet UILabel *lblOrganizationName;
@property (strong, nonatomic) IBOutlet UILabel *lblClusterName;
@property (strong, nonatomic) IBOutlet UILabel *lblViewName;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;

@property (strong, nonatomic) UITapGestureRecognizer *singleTap;

-(void)collapseRecommendationView;
-(void)expandRecommendationView;

-(void)setViewControllers;

//Method to Home View.
-(IBAction)backBtnTapEvent:(id)sender;
-(IBAction)actionBtnTapEvent:(id)sender;

@end
