//
//  SplitViewController.m
//  DriveTo9
//
//  Created by FxBytes on 05/04/2013.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "SplitViewController.h"

@interface SplitViewController ()

@end

@implementation SplitViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withContentId:(NSString*)contentId
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
		self.contentId = contentId;
	}
	return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ---- Overridden Methods ----

/***********************************************************************************************************
 * Method Name                            : - (void)categoryRowTapped:(NSString *)title withSection:(NSInteger)section
 * Description                            : class method to check which category row is tapped.
 * @Param                            title    : string parameter is passed to detect for which section category is tapped
 section: integer to know the section number
 * @return                            : void
 * Modification Log
 * Date                                Author                                        Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013                            FXBytes                                    Created
 ***********************************************************************************************************/

- (void)categoryRowTapped:(NSString *)strRow withSection:(NSString *)strSection title:(NSString *)strTitle {
}

/***********************************************************************************************************
 * Method Name                            : - (void)sectionRowTapped:(NSString *)title withSection:(NSInteger)section
 * Description                            : class method to check which section row is tapped.
 * @Param                            title    : string parameter is passed to detect which section is tapped
 section: integer to know the section number
 * @return                            : void
 * Modification Log
 * Date                                Author                                        Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013                            FXBytes                                    Created
 ***********************************************************************************************************/

- (void)sectionRowTapped:(NSString *)strRow withSection:(NSString *)strSection {
}

/***********************************************************************************************************
* Method Name                            : - (UIView *)currentView
* Description                            : to return the current view on Splitviewcontroller
* @Param                            nil    :
* @return                            : void
* Modification Log
* Date                                Author                                        Description
* ---------------------------------------------------------------------------------------------------------
* 11/4/2013                            FXBytes                                    Created
***********************************************************************************************************/

- (UIView *)currentView {
    //change the frames of all the sliding components
    UIView *controllerView = (UIView *)[[self.view subviews] objectAtIndex:([self.view subviews].count-2)]; //get the top sliding view.
    
    return controllerView;
}
@end
