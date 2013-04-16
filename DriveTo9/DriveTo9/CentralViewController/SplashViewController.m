//
//  CentralViewController.m
//  DriveTo9
//
//  Created by FxBytes on 04/04/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "SplashViewController.h"
#import "AppDelegate.h"
#import "ApplicationMacros.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)init
{
	self = [super init];
	if (self) {
		
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = YES;
        
    [self.lblLogoTitle setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:48]];
    self.lblLogoTitle.text = @"CUCM";
    
    [self.lblLogoSubTitle setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:48]];
    self.lblLogoSubTitle.text = @"Upgrade Central";
	
	//set this view controller to actvate view controller
	ViewManager *manager = [((AppDelegate*)[UIApplication sharedApplication].delegate) manager];
	[manager setActiveViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{  
    [self setLblLogoTitle:nil];
    [super viewDidUnload];
}

#pragma mark view ----- touches delegate -----
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	ViewManager *manager = [((AppDelegate*)[UIApplication sharedApplication].delegate) manager];
	if([manager canSwitchToViewWithId:HOMEVIEWCONTROLLER])
	{
		[manager switchToViewWithId:HOMEVIEWCONTROLLER];
	}
}

@end
