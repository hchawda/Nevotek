//
//  UpgradeCollateralViewController.m
//  DriveTo9
//
//  Created by FxBytes on 06/04/2013.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "UpgradeCollateralViewController.h"

@interface UpgradeCollateralViewController ()

@end

@implementation UpgradeCollateralViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ---- Overridden Methods ----

/***********************************************************************************************************
 * Method Name							: canShowView()
 * Description							: class method to check whether viewcontroller will appear or not.
 * @Param								: nil
 * @return								: Bool
 * Modification Log
 * Date 									Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 4/4/2013									FXBytes									Created
 ***********************************************************************************************************/
-(BOOL)canShowView
{
	[super canShowView];
	return FALSE;
}

@end
