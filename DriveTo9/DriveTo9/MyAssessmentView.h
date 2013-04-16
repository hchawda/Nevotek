//
//  MyAssessmentView.h
//  DriveTo9
//
//  Created by FxBytes on 06/04/2013.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAssessmentView : UIView
{}

@property (nonatomic, weak) IBOutlet UILabel *lblHeaderTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;

-(void)collapseMyAssessmentView;
-(void)expandMyAssessmentView;

-(void)setViewControllers;

//Method to Home View.
-(IBAction)backBtnTapEvent:(id)sender;
@end
