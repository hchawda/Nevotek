//
//  AppDelegate.h
//  DriveTo9
//
//  Created by FxBytes on 03/04/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navController;

//ViewManager Object.
@property (strong, nonatomic) ViewManager *manager;

@end
