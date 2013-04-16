//
//  BaseViewController.h
//  DriveTo9
//
//  Created by FxBytes on 04/04/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *headerLbl;

-(BOOL)canShowView;

@end
