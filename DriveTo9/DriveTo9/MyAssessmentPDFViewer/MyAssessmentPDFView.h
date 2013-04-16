//
//  MyAssessmentPDFView.h
//  DriveTo9
//
//  Created by Vipin Dhangar on 4/11/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface MyAssessmentPDFView : UIView <MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) IBOutlet UIView *vwDeleteShare;
@property (nonatomic, strong) IBOutlet UIView *vwPopUp;
@property (nonatomic, strong) IBOutlet UIButton *btnEmail;
@property (nonatomic, weak) IBOutlet UILabel *lblHeaderTitle;
@property (nonatomic, strong) IBOutlet UIWebView *webViewPdf;

@property (weak, nonatomic) IBOutlet UIButton *btnBack;

-(IBAction)deleteBtnTapped:(id)sender;
-(IBAction)shareBtnTapped:(id)sender;

-(void)setViewControllers:(NSURL *)pdfUrl;

-(void)collapseMyAssessmentPDFViewView;
-(void)expandMyAssessmentPDFViewView;

-(IBAction)backBtnTapEvent:(id)sender;

@end
