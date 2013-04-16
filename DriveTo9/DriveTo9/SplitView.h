//
//  SplitView.h
//  DriveTo9
//
//  Created by FxBytes on 06/04/2013.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplitViewController.h"

@interface SplitView : UIView <UITableViewDataSource, UITableViewDelegate> {
  UITableView *tableView;
  NSArray *arrData;
  NSInteger iSelectedIndex;
  BOOL isBtnTapped;
    
  SplitViewController *targetcController;
    
  BOOL readinessReportReady;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrData;
@property (nonatomic, strong) SplitViewController *targetcController;
@property NSInteger iSelectedIndex;

-(void)setControllerType:(NSString*)controllerType withImage:(NSString*)imageName;
-(void)setHeaderLabelText:(NSString *)text;
-(void)changeSliderImage:(NSString *)imagename;

-(void)addSplitComponentsWithTarget:(SplitViewController *)controller forDataFromPlist:(NSString *)plistName;
-(void)setPopulateArrayFromPlist:(NSString *)strPlistName;
-(void)reloadTableAgain:(NSInteger)iRow;


@end
