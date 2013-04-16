//
//  PDFViewController.h
//  DriveTo9
//
//  Created by Vipin Dhangar on 4/15/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "BaseViewController.h"

@interface PDFViewController : BaseViewController {
    NSString *strPdfName;
}


@property (strong, nonatomic) IBOutlet UINavigationBar *topNavigationBar;
@property (strong, nonatomic) IBOutlet UIWebView *webVwPdf;
@property (strong, nonatomic) NSString *strPdfName;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;

#pragma mark - Load pdf

- (void)btnTappedForPdf:(UIButton *)btn;

@end
