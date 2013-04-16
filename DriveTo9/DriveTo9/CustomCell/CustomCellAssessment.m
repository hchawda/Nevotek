//
//  CustomCellStartAssessment.m
//  DriveTo9
//
//  Created by Vipin Dhangar on 4/9/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "CustomCellAssessment.h"
#import "CustomCellCategory.h"
#import "ViewIdentities.h"
#import "ApplicationMacros.h"

@interface CustomCellAssessment ()

@end

@implementation CustomCellAssessment

@synthesize imgViewBackground;
@synthesize lblTitle;
@synthesize imgViewBtn;
@synthesize btnOnRowTapped;
@synthesize categoryTable;
@synthesize arrayRowData;
@synthesize strSelection;
@synthesize controller;

#pragma mark -------Method to initialize Table and to set its style.
/***********************************************************************************************************
 * Method Name							: - (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
 * Description							: Method to set the objects on UITableView Cell.
 * @Param								style: UITableView Style
              reuseIdentifier: table reuseIdentifier.
 * @return							:id
 * Modification Log
 * Date 								Author 									Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  
  if (self) {
    iSelectedIndex = 0;
    strSelection = @"";
    
    imgViewBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 50)];
    [self.contentView addSubview:self.imgViewBackground];

    imgViewBtn = [[UIImageView alloc] initWithFrame:CGRectMake(6, 5, 40, 40)];
    [self.contentView addSubview:self.imgViewBtn];

    lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(64, 10, 248, 30)];
    lblTitle.backgroundColor = [UIColor clearColor];
    [lblTitle setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTREGULAR size:15]];
    [self.contentView addSubview:self.lblTitle];
    
    btnOnRowTapped = [UIButton buttonWithType:UIButtonTypeCustom];
    btnOnRowTapped.frame = CGRectMake(0, 0, 340, 50);
    [self.contentView addSubview:self.btnOnRowTapped];
    
    // Tasks Table
    categoryTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 45, 350,230)];
    self.categoryTable.delegate = self;
    self.categoryTable.dataSource = self;
    [self.categoryTable setBackgroundColor:[UIColor colorWithRed:(float)242/255 green:(float)244/255 blue:(float)244/255 alpha:1.0]];
    [self.categoryTable   setShowsVerticalScrollIndicator:NO];
    [self.categoryTable setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    
    self.categoryTable.hidden = YES;
    [self.contentView addSubview:categoryTable];

  }
  return self;
}

/***********************************************************************************************************
 * Method Name							: - (void)setValuesOnObjects:(NSArray *)arr atIndex:(NSInteger)index target:(SplitViewController *)target
 * Description							: Method to set the values on objects on UITableView Cell.
 * @Param								arr: data array
                    atIndex: index at which data need to be displayed.
                     target: target is set to call the function when the button is tapped
 * @return							:void
 * Modification Log
 * Date 								Author 									Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
- (void)setValuesOnObjects:(NSArray *)arr atIndex:(NSInteger)index target:(SplitViewController *)target section:(NSString *)strSectionFromMaintable {
  self.lblTitle.text = [[arr objectAtIndex:index] objectForKey:SECTIONTITLE];
  self.controller = target;
  
  self.arrayRowData = [[arr objectAtIndex:index] objectForKey:ROWTITLE];
  
  CGFloat fHeight;
  fHeight = ([self.arrayRowData count] * HEIGHT);
  
  self.categoryTable.frame = CGRectMake(0, HEIGHT, 350, fHeight);

  NSString *strImageName = [[arr objectAtIndex:index] objectForKey:IMAGENAME];
  
  [self.imgViewBtn setImage:[UIImage imageNamed:strImageName]];
  
  self.strSelection = strSectionFromMaintable;
  
  NSString *strSection = [NSString stringWithFormat:@"%i", index + 1];
  NSString *strRow = [NSString stringWithFormat:@"%i", index];
  
  [self.btnOnRowTapped addTarget:nil action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
  [self.btnOnRowTapped setTitle:[NSString stringWithFormat:@"%@_%@",strRow,strSection] forState:UIControlStateNormal];
  [self.btnOnRowTapped setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
  
  [self.categoryTable reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSInteger iTotalRows = [self.arrayRowData count];
  
  return iTotalRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	CustomCellCategory *categoryCell = nil;
  
	if (categoryCell == nil) {
		categoryCell = [[CustomCellCategory alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"categoryCell"];
	}// if
  
  [categoryCell setValuesOnObjects:self.arrayRowData atIndex:indexPath.row target:self forSection:self.strSelection];
  
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *strValue = [defaults objectForKey:self.strSelection];
    
    NSArray *arrSeparated = [strValue componentsSeparatedByString:@"_"];
    
    if ([arrSeparated count] != 0) {
        iSelectedIndex = [[arrSeparated objectAtIndex:0] integerValue];
    } else {
        if ([strSelection isEqualToString:@"1"] && strValue == nil) {
            iSelectedIndex = -1;
        }
    }
    
 if (indexPath.row == iSelectedIndex) {
   [categoryCell.imgViewBackground setImage:[UIImage imageNamed:@"leftButtonSelectedBlue.png"]];
  } else {
    [categoryCell.imgViewBackground setImage:[UIImage imageNamed:@"leftButtonGray.png"]];
  }
  
  categoryCell.selectionStyle = UITableViewCellSelectionStyleNone;
  
  return categoryCell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  CGFloat fHeight = HEIGHT;
  return fHeight;
}

#pragma mark - Private functions
/***********************************************************************************************************
 * Method Name							: - (void)btnCategoryTapped:(UIButton *)btn
 * Description							: Method is called when the category row button is tapped.
 * @Param                btn: button which is tapped ia passed as object
 * @return							:void
 * Modification Log
 * Date 								Author 									Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
- (void)btnCategoryTapped:(UIButton *)btn {
  NSString *strTitle = btn.titleLabel.text;
  NSArray *arrSeparatedComponents = [strTitle componentsSeparatedByString:@"_"];
  
  if ([arrSeparatedComponents count] != 0) {
    
    if (btn == nil) {
      iSelectedIndex = 0;
    } else{
      iSelectedIndex = [[arrSeparatedComponents objectAtIndex:0] integerValue];
    }
    
    NSString *strRow = [NSString stringWithFormat:@"%@",[arrSeparatedComponents objectAtIndex:0]];
    NSString *strSection = [NSString stringWithFormat:@"%@",[arrSeparatedComponents objectAtIndex:1]];
    NSString *strTitle = [NSString stringWithFormat:@"%@",[arrSeparatedComponents objectAtIndex:2]];
      
  NSString *strValue = [NSString stringWithFormat:@"%@_%@_%@", strRow,strSection,strTitle];
  
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [defaults setValue:strValue forKey:self.strSelection];
  [defaults synchronize];
      
    [self.controller categoryRowTapped:strRow withSection:strSection title:strTitle];
  }
  
  [self.categoryTable reloadData];
}

@end
