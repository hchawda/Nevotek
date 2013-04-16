//
//  BaseViewController.m
//  DriveTo9
//
//  Created by FxBytes on 04/04/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
#import "ViewManager.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
    return TRUE;
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

/***********************************************************************************************************
 * Method Name							: shouldAutorotate()
 * Description							: Method to set Landscape orientation for iOS 6.
 * @Param								: nil
 * @return								: Bool
 * Modification Log
 * Date 									Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 5/4/2013									FXBytes									Created
 ***********************************************************************************************************/
- (BOOL)shouldAutorotate {
    
    UIInterfaceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    if (orientation == UIInterfaceOrientationLandscapeLeft  ||orientation ==  UIInterfaceOrientationLandscapeRight )
    {
        return YES;
    }
    return NO;
}

/***********************************************************************************************************
 * Method Name							: canShowView()
 * Description							: Method to set Landscape orientation for iOS 5.
 * @Param								: nil
 * @return								: Bool
 * Modification Log
 * Date 									Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 5/4/2013									FXBytes									Created
 ***********************************************************************************************************/
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    //interfaceOrientation == UIInterfaceOrientationLandscapeRight;
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft  ||interfaceOrientation ==  UIInterfaceOrientationLandscapeRight )
    {
        return YES;
    }
    return NO;
}

- (void)viewDidUnload {
    [self setHeaderLbl:nil];
    [super viewDidUnload];
}
@end
