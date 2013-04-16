//
//  SplitView.m
//  DriveTo9
//
//  Created by FxBytes on 06/04/2013.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "SplitView.h"
#import "SplitHeadingView.h"
#import "CustomCellAssessment.h"
#import "ViewIdentities.h"

@interface SplitView()
@property (nonatomic,strong) SplitHeadingView *splitHeaderView;

@end

@implementation SplitView

@synthesize tableView;
@synthesize arrData;
@synthesize targetcController;
@synthesize iSelectedIndex;

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
		
		UIImageView *sliderBg = [[UIImageView alloc] initWithFrame:CGRectMake(frame.origin.x, 0, frame.size.width+43, 768)];
		sliderBg.image = [UIImage imageNamed:@"SliderBG.png"];
		[self addSubview:sliderBg];
		
		//this block is using when we create split header view.
		self.splitHeaderView = [[SplitHeadingView alloc] initWithFrame:CGRectMake(frame.origin.x, 0, frame.size.width, 55)];
		[self addSubview:self.splitHeaderView];
        
        iSelectedIndex = 0;
        readinessReportReady = NO;
        [self setPopulateArrayFromPlist:@"Drive9"];
	}
    return self;
}

/***********************************************************************************************************
 * Method Name							: addSplitComponentsWithTarget:(SplitViewController *)controller forDataFromPlist:(NSString *)plistName
 * Description							: Method to set table and components in split view.
 * @Param								SplitViewController: controller 
                                        forDataFromPlist: plistName as nsstring.
 * @return							:void 
 * Modification Log
 * Date 								Author 									Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)addSplitComponentsWithTarget:(SplitViewController *)controller forDataFromPlist:(NSString *)plistName {
    
    self.targetcController = controller;
    
    [self setPopulateArrayFromPlist:plistName];
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.splitHeaderView.frame.size.height, self.frame.size.width, 400) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    
    [self.tableView setUserInteractionEnabled:YES];

    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self addSubview:self.tableView];
}

/***********************************************************************************************************
 * Method Name							: enableUserInteraction
 * Description							: Method to interaction on splitview.
 * @Param								: void.
 * @return							    :void
 * Modification Log
 * Date 								Author 									Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
#pragma mark Methods to set SplitView's section and rows.
- (void)enableUserInteraction {
    readinessReportReady = YES;
    if (readinessReportReady) {
        [self.tableView setUserInteractionEnabled:YES];
    }
}

/***********************************************************************************************************
 * Method Name							: changeSliderImage:(NSString *)imagename
 * Description							: Method to components image on splitview.
 * @Param								: imagename: image name as NSString.
 * @return							    :void
 * Modification Log
 * Date 								Author 									Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)changeSliderImage:(NSString *)imagename
{
	UIImageView *sliderBg = (UIImageView *)[[self subviews] objectAtIndex:0];
	sliderBg.image = [UIImage imageNamed:imagename];
}

/***********************************************************************************************************
 * Method Name							: setControllerType:(NSString*)controllerType withImage:(NSString*)imageName
 * Description							: Method to set wheather logo or button will add on split view header.
 * @Param								controllerType: controllerType as a NSString (logo/button)
 withImage: imageName as a NSString.
 * @return							:void
 * Modification Log
 * Date 								Author 									Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)setControllerType:(NSString*)controllerType withImage:(NSString*)imageName;
{
    [self.splitHeaderView setControllerType:controllerType withImage:imageName];
}

/***********************************************************************************************************
 * Method Name							: setHeaderLabelText:(NSString *)text
 * Description							: Method to set title on SplitView header.
 * @Param								(NSString *)text
 * @return							:void
 * Modification Log
 * Date 								Author 									Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)setHeaderLabelText:(NSString *)text
{
	self.splitHeaderView.headerLabel.text = text;
}

#pragma mark Table view data source and delegate.
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrData count];
}

-(UITableViewCell*)tableView:(UITableView*)tableView1 cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    
	CustomCellAssessment *customCell = nil;
    
	if (customCell == nil) {
		customCell = [[CustomCellAssessment alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"customCell"];
	}// if
  
  NSString *strSection = [NSString stringWithFormat:@"%i",iSelectedIndex];
  
    [customCell setValuesOnObjects:self.arrData atIndex:indexPath.row target:self.targetcController section:strSection];
    
    if (iSelectedIndex == indexPath.row && !isBtnTapped) {
        [customCell.imgViewBackground setImage:[UIImage imageNamed:@"leftButtonSelected.png"]];
        customCell.categoryTable.hidden = YES;
    } else if (indexPath.row == iSelectedIndex && isBtnTapped) {
        isBtnTapped = NO;
        [customCell.imgViewBackground setImage:[UIImage imageNamed:@"leftButtonSelectedDown.png"]];
        customCell.categoryTable.hidden = NO;
    } else {
        [customCell.imgViewBackground setImage:[UIImage imageNamed:@"leftButton.png"]];
        customCell.categoryTable.hidden = YES;
    }
    
    return customCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSInteger iRow = [indexPath row];
	CGFloat fHeight;
    
    NSArray *arr = [[self.arrData objectAtIndex:indexPath.row] objectForKey:ROWTITLE];
    
    if (iRow == iSelectedIndex && isBtnTapped) {
        fHeight = ([arr count] * HEIGHT)+HEIGHT;
	} else {
		fHeight = HEIGHT;
	}// else
	return fHeight;
}

/***********************************************************************************************************
 * Method Name							: setPopulateArrayFromPlist:(NSString *)text
 * Description							: Method to set arry from plist.
 * @Param								: strPlistName as NSString.
 * @return                              : void
 * Modification Log
 * Date 								Author 									Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
#pragma mark -------Privatefunctions-------
- (void)setPopulateArrayFromPlist:(NSString *)strPlistName {
    NSString *url = [[NSBundle mainBundle] pathForResource:strPlistName ofType:@"plist"];
    self.arrData = [[NSArray alloc] initWithContentsOfFile:url];
}


/***********************************************************************************************************
 * Method Name							: btnTapped:(UIButton *)btn
 * Description							: Method calls on button tapped on split view.
 * @Param								: void.
 * @return                              : void
 * Modification Log
 * Date 								Author 									Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
- (void)btnTapped:(UIButton *)btn {
  NSString *strBtnTitle = btn.titleLabel.text;
  
  NSArray *arrSeparatedComponents = [strBtnTitle componentsSeparatedByString:@"_"];
  
  if ([arrSeparatedComponents count] != 0) {
    
    if (btn == nil) {
      iSelectedIndex = 0;
    } else{
      iSelectedIndex = [[arrSeparatedComponents objectAtIndex:0] integerValue];
    }

    NSString *strRow = [NSString stringWithFormat:@"%@",[arrSeparatedComponents objectAtIndex:0]];
    NSString *strSection = [NSString stringWithFormat:@"%@",[arrSeparatedComponents objectAtIndex:1]];
        
    [self.targetcController sectionRowTapped:strRow withSection:strSection];
  }

  isBtnTapped = YES;
  [self.tableView reloadData];
}
/***********************************************************************************************************
 * Method Name							: reloadTableAgain:(NSInteger)iRow
 * Description							: Method to reload table.
 * @Param								  iRow :Row id will be pass to rest table.
 * @return                              : void
 * Modification Log
 * Date 								Author 									Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)reloadTableAgain:(NSInteger)iRow
{
    iSelectedIndex = iRow;
    isBtnTapped = TRUE;
    
    [self.tableView reloadData];
}

@end
