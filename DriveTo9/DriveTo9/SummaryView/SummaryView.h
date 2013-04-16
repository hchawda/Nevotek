//
//  SummaryView.h
//  DriveTo9
//
//  Created by FxBytes on 11/04/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVSSHDataMiner.h"
#import "NVCUCMCluster.h"

@interface SummaryView : UIView
{
}


@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet UIButton *btnAction;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;

@property (weak, nonatomic) IBOutlet UILabel *lblHeader;
@property (weak, nonatomic) IBOutlet UILabel *lblViewName;



@property (weak, nonatomic) IBOutlet UIView *vwPopUp;

@property (nonatomic, strong) IBOutlet UIButton *btnEmail;

@property (strong, nonatomic) UIScrollView *scrollVwSummary;


-(void)collapseSummaryView;
-(void)expandSummaryView;

-(void)setViewControllers;

//Method to Home View.
-(IBAction)backBtnTapEvent:(id)sender;
-(IBAction)actionBtnTapEvent:(id)sender;

-(IBAction)emailBtnTapEvent:(id)sender;
@end
