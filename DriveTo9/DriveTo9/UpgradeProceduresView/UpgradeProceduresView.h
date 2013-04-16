//
//  UpgradeProceduresView.h
//  DriveTo9
//
//  Created by Rahul Soni on 4/12/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpgradeProceduresView : UIView
{
}

@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet UIButton *btnDirectUpgrade;
@property (weak, nonatomic) IBOutlet UIButton *btnHighAvailabilityUpgrade;
@property (weak, nonatomic) IBOutlet UIButton *btnBridgedUpgrade;


@property (weak, nonatomic) IBOutlet UILabel *lblHeader;


-(void)collapseUpgradeProceduresView;
-(void)expandUpgradeProceduresView;

-(void)setViewControllers;

//Method to Home View.
-(IBAction)backBtnTapEvent:(id)sender;

-(IBAction)directUpgradeBtnTapEvent:(id)sender;
-(IBAction)highAvailabilityUpgradeBtnTapEvent:(id)sender;
-(IBAction)bridgedUpgradeBtnTapEvent:(id)sender;


@end
