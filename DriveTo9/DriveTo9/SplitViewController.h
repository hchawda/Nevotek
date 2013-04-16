//
//  SplitViewController.h
//  DriveTo9
//
//  Created by FxBytes on 05/04/2013.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "BaseViewController.h"

@interface SplitViewController : BaseViewController

@property (nonatomic) NSString *contentId;

// Pass content id of splitviewcontroller to show the particular view's content.
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withContentId:(NSString*)contentId;

-(void)categoryRowTapped:(NSString *)strRow withSection:(NSString *)strSection title:(NSString *)strTitle;
-(void)sectionRowTapped:(NSString *)strRow withSection:(NSString *)strSection;

-(UIView *)currentView;
@end
