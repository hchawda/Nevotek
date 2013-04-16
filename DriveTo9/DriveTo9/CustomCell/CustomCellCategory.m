//
//  CustomTableCell.m
//  TableViewCell
//
//  Created by Vipin Dhangar on 4/9/13.
//  Copyright (c) 2013 Vipin Dhangar. All rights reserved.
//

#import "CustomCellCategory.h"
#import "ViewIdentities.h"

@interface CustomCellCategory ()

@end

@implementation CustomCellCategory

@synthesize imgViewBackground;
@synthesize lblTitle;
@synthesize imgViewBtn;
@synthesize btnOnRowTapped;

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
    
    imgViewBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 45)];
    [self.contentView addSubview:self.imgViewBackground];
    
    imgViewBtn = [[UIImageView alloc] initWithFrame:CGRectMake(15, 3, 40, 40)];
    [self.contentView addSubview:self.imgViewBtn];
    
    lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(64, 4, 320, 30)];
    lblTitle.backgroundColor = [UIColor clearColor];
    self.lblTitle.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.lblTitle];
    
    btnOnRowTapped = [UIButton buttonWithType:UIButtonTypeCustom];
    btnOnRowTapped.frame = CGRectMake(0, 0, 330, 45);
    [btnOnRowTapped setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:self.btnOnRowTapped];
    [self.contentView bringSubviewToFront:self.btnOnRowTapped];
  }
  return self;
}


/***********************************************************************************************************
 * Method Name							: - (void)setValuesOnObjects:(NSArray *)arr atIndex:(NSInteger)index target:(CustomCellAssessment *)target
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
- (void)setValuesOnObjects:(NSArray *)arr atIndex:(NSInteger)index target:(CustomCellAssessment *)target forSection:(NSString *)section {
  self.lblTitle.text = [[arr objectAtIndex:index] objectForKey:@"title"];
  
  NSString *strImageName = [[arr objectAtIndex:index] objectForKey:IMAGENAME];
  
  if ([strImageName isEqualToString:@""]) {
    [self.imgViewBtn setImage:[UIImage imageNamed:strImageName]];
    self.lblTitle.frame = CGRectMake(20, 4, 320, 30);
  } else {
    [self.imgViewBtn setImage:[UIImage imageNamed:strImageName]];
    self.lblTitle.frame = CGRectMake(75, 4, 320, 30);
  }

  NSString *strSection = [NSString stringWithFormat:@"%i", [section integerValue]+1];
  NSString *strRow = [NSString stringWithFormat:@"%i", index];
  
  [self.btnOnRowTapped addTarget:target action:@selector(btnCategoryTapped:) forControlEvents:UIControlEventTouchUpInside];
  [self.btnOnRowTapped setTitle:[NSString stringWithFormat:@"%@_%@_%@",strRow,strSection,self.lblTitle.text] forState:UIControlStateNormal];
  [self.btnOnRowTapped setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
}

@end
