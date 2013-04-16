//
//  HomeViewController.h
//  DriveTo9
//
//  Created by FxBytes on 05/04/2013.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface HomeViewController : BaseViewController
{
}
@property (strong, nonatomic) IBOutlet UINavigationBar *topNavigationBar;

@property (strong, nonatomic) IBOutlet UILabel *lblURA;
@property (strong, nonatomic) IBOutlet UILabel *lblUC;
@property (strong, nonatomic) IBOutlet UILabel *lblUSS;

@end
