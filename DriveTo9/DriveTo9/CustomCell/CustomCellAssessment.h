//
//  CustomCellStartAssessment.h
//  DriveTo9
//
//  Created by Vipin Dhangar on 4/9/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplitViewController.h"

@interface CustomCellAssessment : UITableViewCell <UITableViewDataSource, UITableViewDelegate> {
  NSInteger iSelectedIndex;
  NSString *strSelection;
  
  SplitViewController *controller;
}

@property (nonatomic, strong) UIImageView *imgViewBackground;
@property (nonatomic, strong) UIImageView *imgViewBtn;
@property (nonatomic, strong) UILabel *lblTitle;
@property (nonatomic, strong) UIButton *btnOnRowTapped;
@property (nonatomic, strong) UITableView *categoryTable;
@property (nonatomic, strong) NSMutableArray *arrayRowData;
@property (nonatomic, strong) NSString *strSelection;
@property (nonatomic, strong) SplitViewController *controller;

//Method to set the values on objects on UITableView Cell.
-(void)setValuesOnObjects:(NSArray *)arr atIndex:(NSInteger)index target:(SplitViewController *)target section:(NSString *)strSectionFromMaintable;

@end
