//
//  HeadingView.m
//  DriveTo9
//
//  Created by FxBytes on 06/04/2013.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "SplitHeadingView.h"
#import "ApplicationMacros.h"

@implementation SplitHeadingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
	    [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"leftPane.png"]]];
	    
	    self.headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 0, 280, 55)];
	    self.headerLabel.textColor = [UIColor whiteColor];
	    self.headerLabel.backgroundColor = [UIColor clearColor];
	    self.headerLabel.font = [UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:15];
	    [self addSubview:self.headerLabel];
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

#pragma mark -------Set split view header MEthod---------
/***********************************************************************************************************
 * Method Name							: setControllerType:(NSString*)controllerType withImage:(NSString*)imageName
 * Description							: Method to set wheather logo or button will add on split view header.
 * @Param								controllerType: controllerType as a NSString (logo/button)
 withImage: imageName as a NSString.
 * @return							:void
 * Modification Log
 * Date 								Author 									Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)setControllerType:(NSString*)controllerType withImage:(NSString*)imageName
{
    if([controllerType isEqualToString:@"logo"])
    {
        self.logoImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 45, 45)];
        self.logoImgView.image = [UIImage imageNamed:imageName];
	    [self addSubview:self.logoImgView];
    }
    else if([controllerType isEqualToString:@"button"])
    {
        self.backBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 10, 54, 31)];
        [self.backBtn addTarget:nil action:@selector(backBtnTapEvent) forControlEvents:UIControlEventTouchUpInside];
        [self.backBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [self.backBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        [self.backBtn setTitle:@"Back" forState:UIControlStateNormal];
        [self.backBtn.titleLabel setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:12.0]];
	    [self addSubview:self.backBtn];
    }
}

@end