//
//  HeadingView.h
//  DriveTo9
//
//  Created by FxBytes on 06/04/2013.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplitHeadingView : UIView

//Controllers of SplitView.
@property (nonatomic,strong) UIImageView *logoImgView;
@property (nonatomic,strong) UIButton *backBtn;
@property (nonatomic,strong) UILabel *headerLabel;

//Method to set wheather logo or button will add on split view header.
-(void)setControllerType:(NSString*)controllerType withImage:(NSString*)imageName;

@end
