//
//  CustomTableCell.h
//  TableViewCell
//
//  Created by Vipin Dhangar on 4/9/13.
//  Copyright (c) 2013 Vipin Dhangar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCellAssessment.h"

@interface CustomCellCategory : UITableViewCell

@property (nonatomic, strong) UIImageView *imgViewBackground;
@property (nonatomic, strong) UIImageView *imgViewBtn;
@property (nonatomic, strong) UILabel *lblTitle;
@property (nonatomic, strong) UIButton *btnOnRowTapped;

//Method to set the values on objects on UITableView Cell.
- (void)setValuesOnObjects:(NSArray *)arr atIndex:(NSInteger)index target:(CustomCellAssessment *)target forSection:(NSString *)section;

@end
