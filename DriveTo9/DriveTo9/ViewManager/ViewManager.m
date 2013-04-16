//
//  ViewManager.m
//  DriveTo9
//
//  Created by FxBytes on 04/04/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "ViewManager.h"

#import "BaseViewController.h"
#import "SplashViewController.h"
#import "HomeViewController.h"
#import "UpgradeReadinessAssessmentViewController.h"

static ViewManager *sharedManagerVar = nil;

@implementation ViewManager


#pragma mark ---- singleton object methods ----

/***********************************************************************************************************
 * Method Name							: sharedManager()
 * Description							: Creating a Singleton Instance.
 * @Param								: nil
 * @return								: ViewManager's shared Object
 * Modification Log
 * Date 									Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 4/4/2013									FXBytes									Created
 ***********************************************************************************************************/
+ (ViewManager *)sharedManager
{
	@synchronized(self)
	{
        if (sharedManagerVar == nil)
		{
            sharedManagerVar = [[self alloc] init]; 
            sharedManagerVar.viewTranstionStyle = kTransitionStyleCrossDissolve;
            sharedManagerVar.dictionaoryOfViewsId = [[NSMutableDictionary alloc] init];
        }
    }
    return sharedManagerVar;
}

/***********************************************************************************************************
 * Method Name							: registerViewsToManager()
 * Description							: Method to register all views to the ViewManager.Put all the entries of view controllers here.
 * @Param								: nil
 * @return							: nil
 * Modification Log
 * Date 								Author 									Description
 * ---------------------------------------------------------------------------------------------------------
 * 4/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)registerViewsToManager
{
	[self.dictionaoryOfViewsId setObject:@"SplashViewController" forKey:SPLASHVIEWUNIQUEID];
	[self.dictionaoryOfViewsId setObject:@"HomeViewController" forKey:HOMEVIEWCONTROLLER];
	[self.dictionaoryOfViewsId setObject:@"UpgradeReadinessAssessmentViewController" forKey:UPGRADEREADINESSASSESSMENTVIEWCONTROLLER];
	[self.dictionaoryOfViewsId setObject:@"UpgradeCollateralViewController" forKey:UPGRADECOLLATERALVIEWCONTROLLER];
	[self.dictionaoryOfViewsId setObject:@"UpgradeSupportServicesViewController" forKey:UPGRADESUPPORTSERVICESVIEWCONTROLLER];
    [self.dictionaoryOfViewsId setObject:@"AboutViewController" forKey:ABOUTVIEWCONTROLLER];
    [self.dictionaoryOfViewsId setObject:@"PDFViewController" forKey:PDFVIEWCONTROLLER];
}

/***********************************************************************************************************
 * Method Name							: setViewTransitionStyle()
 * Description							: Method Pass Transition Style here to set ViewController's transition style.
 * @Param								: ViewTransitionStyle
 * @return								: nil
 * Modification Log
 * Date 									Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 4/4/2013									FXBytes									Created
 ***********************************************************************************************************/
-(void)setViewTransitionStyle:(ViewTransitionStyle)transitionStyle
{
    sharedManagerVar.viewTranstionStyle = transitionStyle;
}

/***********************************************************************************************************
 * Method Name							: navigateViewController(BaseViewController*) WithStyle:(ViewTransitionStyle)
 * Description							: Method Pass Transition Style here to set ViewController's transition style.
 * @Param								: ViewTransitionStyle as a transition style
									: BaseViewController: view that will be transite.
 * @return							: nil
 * Modification Log
 * Date 								Author 									Description
 * ---------------------------------------------------------------------------------------------------------
 * 4/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)navigateViewController:(BaseViewController*)baseViewController WithStyle:(ViewTransitionStyle)transitionStyle
{
	switch (transitionStyle) {
		case kTransitionStyleCrossDissolve:
			
			[UIView transitionFromView:[self activeViewController].view toView:baseViewController.view duration:1.0f options:UIViewAnimationOptionTransitionCrossDissolve completion:nil];
			break;
		default:
			break;
	}
}

/***********************************************************************************************************
 * Method Name							: switchToViewWithID()
 * Description							: Method to switch to respective view controllers, according to given viewcontroller's id.
 * @Param								: viewController id as a NSString
 * @return							: nil
 * Modification Log
 * Date 								Author 									Description
 * ---------------------------------------------------------------------------------------------------------
 * 4/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)switchToViewWithId:(NSString*)viewControllerId
{
	[self switchToViewWithId:viewControllerId contentId:@"1"];
}

/***********************************************************************************************************
 * Method Name							: switchToViewWithID(NSString*) contentId(NSString*)
 * Description							: Method to switch to respective view controllers, according to given viewcontroller's id.
 * @Param								viewControllerId: viewController id as a NSString
									contentId: we show content of splitviewcontroller based on this contentId. If view is splitviewcontrller otherwise normal view controller will show.
 * @return							:void
 * Modification Log
 * Date 								Author 									Description
 * ---------------------------------------------------------------------------------------------------------
 * 5/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)switchToViewWithId:(NSString*)viewControllerId contentId:(NSString*)contentId
{
	BaseViewController *baseViewController = nil;
	
	Class class = NSClassFromString([self.dictionaoryOfViewsId objectForKey:viewControllerId]);
	
	//fetch view controller based on view id.
	if ([class isSubclassOfClass:[SplitViewController class]]) {
		baseViewController = [[NSClassFromString([self.dictionaoryOfViewsId objectForKey:viewControllerId]) alloc] initWithNibName:[self.dictionaoryOfViewsId objectForKey:viewControllerId] bundle:nil withContentId:contentId];
	}
	else {
		baseViewController = [[NSClassFromString([self.dictionaoryOfViewsId objectForKey:viewControllerId]) alloc] initWithNibName:[self.dictionaoryOfViewsId objectForKey:viewControllerId] bundle:nil];
	}
	
	[self navigateViewController:baseViewController WithStyle:self.viewTranstionStyle];
}

/***********************************************************************************************************
 * Method Name							: canSwitchToViewWithID()
 * Description							: Method to check either view can accissble or not.
 * @Param								: viewController id as a NSString
 * @return							: Bool
 * Modification Log
 * Date 								Author 									Description
 * ---------------------------------------------------------------------------------------------------------
 * 4/4/2013							FXBytes									Created
 ***********************************************************************************************************/
- (BOOL)canSwitchToViewWithId:(NSString*)viewControllerId
{
	BOOL canSwitch = NO;
  
	BaseViewController *baseViewController = [[NSClassFromString([self.dictionaoryOfViewsId objectForKey:viewControllerId]) alloc] initWithNibName:[self.dictionaoryOfViewsId objectForKey:viewControllerId] bundle:nil];
	canSwitch = [baseViewController canShowView];
	
	return canSwitch;
}

@end
