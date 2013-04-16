//
//  SaveView.h
//  DriveTo9
//
//  Created by FxBytes on 15/04/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SaveView : UIView <UITextFieldDelegate>
{
}

@property (weak, nonatomic) IBOutlet UIButton *btnSaveConfirm;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;

@property (weak, nonatomic) IBOutlet UILabel *lblSave;
@property (weak, nonatomic) IBOutlet UILabel *lblReportName;

@property (weak, nonatomic) IBOutlet UITextField *txtFieldReportName;

-(IBAction)saveConfirmBtnTapEvent:(id)sender;

-(void)setViewControllers;

@end
