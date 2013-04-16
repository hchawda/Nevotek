//
//  ViewManager.h
//  DriveTo9
//
//  Created by FxBytes on 04/04/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CommonEnums.h"
#import "ViewIdentities.h"

@class BaseViewController;

@interface ViewManager : NSObject
{
}
@property (strong, nonatomic) BaseViewController *activeViewController;
@property (strong, nonatomic) NSMutableDictionary *dictionaoryOfViewsId; // to hold all view controller's id's as key and names as value.
@property (nonatomic) ViewTransitionStyle viewTranstionStyle; // to hold view controller's transition style.

//Singlton object creating Method.
+ (ViewManager *)sharedManager;

//Method to register all views to the ViewManager.
-(void)registerViewsToManager;

//Method to set view's transition style.
-(void)setViewTransitionStyle:(ViewTransitionStyle)transitionStyle;

//Method to return currently activated View Controller.
-(BaseViewController *)activeViewController;

//Method to check view's accessibility.
-(BOOL)canSwitchToViewWithId:(NSString*)viewControllerId;

//Method to switch to respective view controllers.
-(void)switchToViewWithId:(NSString*)viewControllerId;

//Method to switch to respective content of split view controllers.
-(void)switchToViewWithId:(NSString*)viewControllerId contentId:(NSString*)contentId;

@end
