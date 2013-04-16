//
//  UpgradeReadinessAssessmentViewController.h
//  DriveTo9
//
//  Created by FxBytes on 05/04/2013.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "SplitViewController.h"
#import <MessageUI/MessageUI.h>


@interface UpgradeReadinessAssessmentViewController : SplitViewController <MFMailComposeViewControllerDelegate>
{
    BOOL isTouchesEnd; //Flag to check either collapse or expand method is call after touches move or after touches end.
}

- (IBAction)openHomeView:(id)sender;
- (void)sectionRowTapped:(NSString *)strRow withSection:(NSString *)strSection;

@end
