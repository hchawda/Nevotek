//
//  SummaryView.m
//  DriveTo9
//
//  Created by FxBytes on 11/04/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "SummaryView.h"
#import "ApplicationMacros.h"
#import "ViewManager.h"
#import "AppDelegate.h"

#import "NVServerAssessment.h"

@implementation SummaryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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

#pragma mark -------Method to set controllers while loading-------
/***********************************************************************************************************
 * Method Name							: setViewControllers
 * Description							: Method to set controllers of SummaryViewController.
 * @Param								: nil.
 * @return							    : void
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)setViewControllers
{
    [self.btnEmail addTarget:nil action:@selector(emailBtnTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.btnSave addTarget:nil action:@selector(saveBtnTapped) forControlEvents:UIControlEventTouchUpInside];

    
    [self.lblHeader setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:24]];
    self.lblHeader.text = @"Summary";
    
    [self.lblViewName setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:20]];
    self.lblViewName.text = @"Summary";
    
    [self.btnBack.titleLabel setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:12.0]];
    [self.btnBack setTitle:@"Back" forState:UIControlStateNormal];
    
    NVCUCMCluster *cluster = [NVSSHDataMiner getCluster];
    NSLog(@"%@",cluster.report.softwareAssessment.recommendation);
    
    if(self.scrollVwSummary == nil)
    {
        self.scrollVwSummary = [[UIScrollView alloc] initWithFrame:CGRectMake(83, 130, 581, 595)];
        [self.scrollVwSummary setBackgroundColor:[UIColor clearColor]];
        self.scrollVwSummary.tag = 30;
        [self addSubview:self.scrollVwSummary];
    

    int yDiff = 0;
    
    UILabel *lblDescription = [[UILabel alloc] initWithFrame:CGRectMake(20, yDiff, 550, 60)];
    lblDescription.text = @"The following is a summary of assessment report,please refer to the readiness recommendations for details.";
    lblDescription.tag = 31;
    [lblDescription setNumberOfLines:2];
    [lblDescription setTextColor:[UIColor blackColor]];
    [lblDescription setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14]];
    [lblDescription setBackgroundColor:[UIColor clearColor]];
    [self.scrollVwSummary addSubview:lblDescription];
    
//    -------------------  
    yDiff = yDiff + 80;
    
    UIImageView *imgViewLine = [[UIImageView alloc] initWithFrame:CGRectMake(20, yDiff, 550, 1)];
    imgViewLine.tag = 33;
    [imgViewLine setBackgroundColor:[UIColor grayColor]];
    [self.scrollVwSummary addSubview:imgViewLine];
    
    UILabel *lblCucm = [[UILabel alloc] initWithFrame:CGRectMake(20, yDiff + 2, 70, 40)];
    lblCucm.text = @"CUCM";
    lblCucm.tag = 32;
    [lblCucm setTextColor:[UIColor blackColor]];
    [lblCucm setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTBOLD size:14.0]];
    [lblCucm setBackgroundColor:[UIColor clearColor]];
    [self.scrollVwSummary addSubview:lblCucm];
    
    UIImageView *imgViewSoftwareCUCMIcon = [[UIImageView alloc] initWithFrame:CGRectMake(170, yDiff + 12, 21, 21)];
    imgViewSoftwareCUCMIcon.tag = 34;
    if([cluster.report.summary.softwareIcon isEqualToString:@"GREEN"])
    {
        imgViewSoftwareCUCMIcon.image = [UIImage imageNamed:@"ok.png"];
    }
    else
    {
        imgViewSoftwareCUCMIcon.image = [UIImage imageNamed:@"alert.png"];
    }
    [self.scrollVwSummary addSubview:imgViewSoftwareCUCMIcon];
    
    
    UILabel *lblCUCMMsg = [[UILabel alloc] initWithFrame:CGRectMake(200, yDiff + 12, 350, 50)];
    if ([[NSString stringWithFormat:@"%@", cluster.report.summary.softwareMassage] isEqualToString:@"(null)"]) {
        cluster.report.summary.softwareMassage = @"-";
    }
    lblCUCMMsg.text = [NSString stringWithFormat:@"%@", cluster.report.summary.softwareMassage];
 

    lblCUCMMsg.tag = 35;
    [lblCUCMMsg setTextColor:[UIColor blackColor]];
    [lblCUCMMsg setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
    [lblCUCMMsg setBackgroundColor:[UIColor clearColor]];
        

    lblCUCMMsg.lineBreakMode = UILineBreakModeWordWrap;
        
    CGSize expectedLabelSize = [lblCUCMMsg.text sizeWithFont:lblCUCMMsg.font
                                    constrainedToSize:CGSizeMake(300, 1000)
                                        lineBreakMode:UILineBreakModeWordWrap];
        NSLog(@"%f",expectedLabelSize.height);
    CGRect newFrame = lblCUCMMsg.frame;
    newFrame.size.height = expectedLabelSize.height;
    lblCUCMMsg.frame = newFrame;
    lblCUCMMsg.numberOfLines = 0;
    [lblCUCMMsg sizeToFit];
    [self.scrollVwSummary addSubview:lblCUCMMsg];
        
        if(expectedLabelSize.height <= 20)
            yDiff = yDiff + 55;
        else
            yDiff = yDiff + expectedLabelSize.height + 40;
 
    
  //    -------------------  
    UIImageView *imgViewLine1 = [[UIImageView alloc] initWithFrame:CGRectMake(20, yDiff, 550, 1)];
    imgViewLine1.tag = 33;
    [imgViewLine1 setBackgroundColor:[UIColor grayColor]];
    [self.scrollVwSummary addSubview:imgViewLine1];
    
    UILabel *lblServerFirst = [[UILabel alloc] initWithFrame:CGRectMake(20, yDiff + 2, 70, 40)];
    lblServerFirst.text = @"Server";
    lblServerFirst.tag = 32;
    [lblServerFirst setTextColor:[UIColor blackColor]];
    [lblServerFirst setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTBOLD size:14.0]];
    [lblServerFirst setBackgroundColor:[UIColor clearColor]];
    [self.scrollVwSummary addSubview:lblServerFirst];
    
    UIImageView *imgViewSoftwareServerIcon = [[UIImageView alloc] initWithFrame:CGRectMake(170, yDiff + 12, 21, 21)];
    imgViewSoftwareServerIcon.tag = 34;
    if([cluster.report.summary.hardwareIcon isEqualToString:@"GREEN"])
    {
        imgViewSoftwareServerIcon.image = [UIImage imageNamed:@"ok.png"];
    }
    else
    {
        imgViewSoftwareServerIcon.image = [UIImage imageNamed:@"alert.png"];
    }
    [self.scrollVwSummary addSubview:imgViewSoftwareServerIcon];
    
    
    UILabel *lblServerMsg = [[UILabel alloc] initWithFrame:CGRectMake(200, yDiff + 12, 300, 50)];
    if ([[NSString stringWithFormat:@"%@", cluster.report.summary.hardwareMessage] isEqualToString:@"(null)"]) {
        cluster.report.summary.hardwareMessage = @"-";
    }
    lblServerMsg.text = [NSString stringWithFormat:@"%@", cluster.report.summary.hardwareMessage];

    lblServerMsg.tag = 35;
    [lblServerMsg setTextColor:[UIColor blackColor]];
    [lblServerMsg setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
    [lblServerMsg setBackgroundColor:[UIColor clearColor]];
      
        lblServerMsg.lineBreakMode = UILineBreakModeWordWrap;
        
        CGSize expectedLabelSize1 = [lblServerMsg.text sizeWithFont:lblServerMsg.font
                                                  constrainedToSize:CGSizeMake(300, 1000)
                                                   lineBreakMode:UILineBreakModeWordWrap];
        NSLog(@"%f",expectedLabelSize1.height);
        CGRect newFrame1 = lblServerMsg.frame;
        newFrame1.size.height = expectedLabelSize1.height;
        lblServerMsg.frame = newFrame1;
        lblServerMsg.numberOfLines = 0;
        [lblServerMsg sizeToFit];
        [self.scrollVwSummary addSubview:lblServerMsg];
        
        if(expectedLabelSize1.height <= 20)
            yDiff = yDiff + 55;
        else
            yDiff = yDiff + expectedLabelSize1.height + 40;
    
//-----------------
    
    UIImageView *imgViewLine2 = [[UIImageView alloc] initWithFrame:CGRectMake(20, yDiff, 550, 1)];
    imgViewLine2.tag = 33;
    [imgViewLine2 setBackgroundColor:[UIColor grayColor]];
    [self.scrollVwSummary addSubview:imgViewLine2];

    
    UILabel *lblEndPoints = [[UILabel alloc] initWithFrame:CGRectMake(20, yDiff + 2, 70, 40)];
    lblEndPoints.text = @"Endpoints";
    lblEndPoints.tag = 32;
    [lblEndPoints setTextColor:[UIColor blackColor]];
    [lblEndPoints setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTBOLD size:14.0]];
    [lblEndPoints setBackgroundColor:[UIColor clearColor]];
    [self.scrollVwSummary addSubview:lblEndPoints];
    
    UIImageView *imgViewSoftwareEndPointsIcon = [[UIImageView alloc] initWithFrame:CGRectMake(170, yDiff + 12, 21, 21)];
    imgViewSoftwareEndPointsIcon.tag = 34;
    if([cluster.report.summary.endpointsIcon isEqualToString:@"GREEN"])
    {
        imgViewSoftwareEndPointsIcon.image = [UIImage imageNamed:@"ok.png"];
    }
    else
    {
        imgViewSoftwareEndPointsIcon.image = [UIImage imageNamed:@"alert.png"];
    }
    [self.scrollVwSummary addSubview:imgViewSoftwareEndPointsIcon];
    
    
    UILabel *lblEndPointsMsg = [[UILabel alloc] initWithFrame:CGRectMake(200, yDiff + 12, 300, 50)];
    if ([[NSString stringWithFormat:@"%@", cluster.report.summary.endpointsMessage] isEqualToString:@"(null)"]) {
        cluster.report.summary.hardwareMessage = @"-";
    }
    lblEndPointsMsg.text = [NSString stringWithFormat:@"%@", cluster.report.summary.endpointsMessage];
    lblEndPointsMsg.tag = 35;
    [lblEndPointsMsg setTextColor:[UIColor blackColor]];
    [lblEndPointsMsg setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
    [lblEndPointsMsg setBackgroundColor:[UIColor clearColor]];

        lblEndPointsMsg.lineBreakMode = UILineBreakModeWordWrap;
        
        CGSize expectedLabelSize2 = [lblEndPointsMsg.text sizeWithFont:lblEndPointsMsg.font
                                                constrainedToSize:CGSizeMake(300, 1000)
                                                    lineBreakMode:UILineBreakModeWordWrap];
        
        CGRect newFrame2 = lblEndPointsMsg.frame;
        newFrame2.size.height = expectedLabelSize2.height;
        lblEndPointsMsg.frame = newFrame2;
        lblEndPointsMsg.numberOfLines = 0;
        [lblEndPointsMsg sizeToFit];
        [self.scrollVwSummary addSubview:lblEndPointsMsg];

        
        if(expectedLabelSize2.height <= 20)
            yDiff = yDiff + 55;
        else
            yDiff = yDiff + expectedLabelSize2.height + 40;
    
    UIImageView *imgViewLine3 = [[UIImageView alloc] initWithFrame:CGRectMake(20, yDiff, 550, 1)];
    imgViewLine3.tag = 33;
    [imgViewLine3 setBackgroundColor:[UIColor grayColor]];
    [self.scrollVwSummary addSubview:imgViewLine3];
    //-----------------
    
    }
}

#pragma mark -------Method to set Collapse and Expanding-------
/***********************************************************************************************************
 * Method Name							: expandIsOpenUnityConnectionView
 * Description							: Method to reset expandUnityConnectionView.
 * @Param								: nil.
 * @return							    : void.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)expandSummaryView
{
    self.btnBack.hidden = NO;
    for (UIView *innerControllerView in [self subviews])
    {
        if ([innerControllerView isKindOfClass:[UIImageView class]])
        {
            if(innerControllerView.tag == 23)
            {
                ((UIImageView *)innerControllerView).frame = CGRectMake(50, innerControllerView.frame.origin.y, 950, innerControllerView.frame.size.height);
            }
            
        }//if end.
        
        else if ([innerControllerView isKindOfClass:[UIButton class]])
        {
            if(innerControllerView.tag == 24)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(20, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 25)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(950, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            
        }//else if end.
        
        else if ([innerControllerView isKindOfClass:[UILabel class]])
        {
            if(innerControllerView.tag == 26)
            {
                ((UILabel *)innerControllerView).center = CGPointMake(512, 30);
            }
            if(innerControllerView.tag == 27)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(70, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }//else if end.
        
        else if ([innerControllerView isKindOfClass:[UIScrollView class]])
        {
            if(innerControllerView.tag == 30)
            {
                ((UIScrollView *)innerControllerView).frame = CGRectMake(50, innerControllerView.frame.origin.y, 916, innerControllerView.frame.size.height);
                
                UIScrollView *scrollView = (UIScrollView *)innerControllerView;
                
                for (UIView *innerScrollView in [scrollView subviews])
                {
                    if ([innerScrollView isKindOfClass:[UILabel class]])
                    {
                        if(innerScrollView.tag == 32)
                        {
                            
                        }
                        else if (innerScrollView.tag == 31)
                        {
                            ((UILabel *)innerScrollView).frame = CGRectMake(innerScrollView.frame.origin.x, innerScrollView.frame.origin.y, 880, innerScrollView.frame.size.height);
                        }
                        else if (innerScrollView.tag == 35)
                        {
                            ((UILabel *)innerScrollView).frame = CGRectMake(450, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                    }
                    
                    if ([innerScrollView isKindOfClass:[UIImageView class]])
                    {
                        if(innerScrollView.tag == 33)
                        {
                            ((UIImageView *)innerScrollView).frame = CGRectMake(innerScrollView.frame.origin.x, innerScrollView.frame.origin.y, 900, innerScrollView.frame.size.height);
                        }
                        else if (innerScrollView.tag == 34)
                        {
                            ((UIImageView *)innerScrollView).frame = CGRectMake(420, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                    }
                    
                }
            }
        }//if end.

        
        else if ([innerControllerView isKindOfClass:[UIView class]])
        {
            if(innerControllerView.tag == 28)
            {
                ((UIView *)innerControllerView).frame = CGRectMake(770, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            
        }//if end.
        
    } //for loop ends
}

/***********************************************************************************************************
 * Method Name							: collapseInformationView
 * Description							: Method to reset collapseInformationView.
 * @Param								: nil.
 * @return							    : void.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 10/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)collapseSummaryView
{
    self.btnBack.hidden = YES;
    
    for (UIView *innerControllerView in [self subviews])
    {
        if ([innerControllerView isKindOfClass:[UIImageView class]])
        {
            if(innerControllerView.tag == 23)
            {
                ((UIImageView *)innerControllerView).frame = CGRectMake(83, innerControllerView.frame.origin.y, 581, innerControllerView.frame.size.height);
            }
            
        }//if end.
        
        if ([innerControllerView isKindOfClass:[UILabel class]])
        {
            if(innerControllerView.tag == 26)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(176, 20, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 27)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(102, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }
        
        else if ([innerControllerView isKindOfClass:[UIButton class]])
        {
            if(innerControllerView.tag == 24)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(20, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 25)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(624, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }
        
        else if ([innerControllerView isKindOfClass:[UIScrollView class]])
        {
            if(innerControllerView.tag == 30)
            {
                ((UIScrollView *)innerControllerView).frame = CGRectMake(83, innerControllerView.frame.origin.y, 581, innerControllerView.frame.size.height);
                
                UIScrollView *scrollView = (UIScrollView *)innerControllerView;
                
                for (UIView *innerScrollView in [scrollView subviews])
                {
                    if ([innerScrollView isKindOfClass:[UILabel class]])
                    {
                        if(innerScrollView.tag == 32)
                        {
                            
                        }
                        else if (innerScrollView.tag == 31)
                        {
                            ((UILabel *)innerScrollView).frame = CGRectMake(innerScrollView.frame.origin.x, innerScrollView.frame.origin.y, 550, innerScrollView.frame.size.height);
                        }
                        else if (innerScrollView.tag == 35)
                        {
                            ((UILabel *)innerScrollView).frame = CGRectMake(200, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                    }
                    
                    if ([innerScrollView isKindOfClass:[UIImageView class]])
                    {
                        if(innerScrollView.tag == 33)
                        {
                            ((UIImageView *)innerScrollView).frame = CGRectMake(20, innerScrollView.frame.origin.y, 550, innerScrollView.frame.size.height);
                        }
                        else if (innerScrollView.tag == 34)
                        {
                            ((UIImageView *)innerScrollView).frame = CGRectMake(170, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                    }
                    
                }
            }
        }//if end
        
        else if ([innerControllerView isKindOfClass:[UIView class]])
        {
            if(innerControllerView.tag == 28)
            {
                ((UIView *)innerControllerView).frame = CGRectMake(445, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            
        }//if end.

        
    }
    
}

#pragma mark -------Action Methods-------
/***********************************************************************************************************
 * Method Name							: backBtnTapEvent:(id)sender
 * Description							: Method to open Home View.
 * @Param								: sender.
 * @return							    : IBAction.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(IBAction)backBtnTapEvent:(id)sender
{
    ViewManager *manager = [((AppDelegate*)[UIApplication sharedApplication].delegate) manager];
	if([manager canSwitchToViewWithId:HOMEVIEWCONTROLLER])
	{
		[manager switchToViewWithId:HOMEVIEWCONTROLLER];
	}
}

/***********************************************************************************************************
 * Method Name							: actionBtnTapEvent:(id)sender
 * Description							: Method to PopUp View, which contains Save and Email Button.
 * @Param								: sender.
 * @return							    : IBAction.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(IBAction)actionBtnTapEvent:(id)sender
{
    [self bringSubviewToFront:self.vwPopUp];
    if(self.vwPopUp.hidden == YES)
        self.vwPopUp.hidden = NO;
    else
        self.vwPopUp.hidden = YES;
}

/***********************************************************************************************************
 * Method Name							: saveBtnTapEvent:(id)sender
 * Description							: Method to Save User Created data.
 * @Param								: sender.
 * @return							    : IBAction.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013							FXBytes									Created
 ***********************************************************************************************************/


/***********************************************************************************************************
 * Method Name							: emailBtnTapEvent:(id)sender
 * Description							: Method to open Email Pop up.
 * @Param								: sender.
 * @return							    : IBAction.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(IBAction)emailBtnTapEvent:(id)sender
{
    self.vwPopUp.hidden = NO;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Under Development." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.vwPopUp.hidden = YES;
}

@end
