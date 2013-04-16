//
//  CurrentEnvironmentViewController.m
//  DriveTo9
//
//  Created by FxBytes on 11/04/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "CurrentEnvironmentViewController.h"
#import "ApplicationMacros.h"
#import "ViewManager.h"
#import "AppDelegate.h"
#import "NVServerAssessment.h"

@implementation CurrentEnvironmentViewController

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
 * Description							: Method to set controllers of CurrentViewController.
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
    self.lblHeader.text = @"Current Environment";
    
    [self.lblViewName setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:20]];
    self.lblViewName.text = @"Current Environment";
    
    [self.btnBack.titleLabel setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:12.0]];
    [self.btnBack setTitle:@"Back" forState:UIControlStateNormal];
    
    NVCUCMCluster *cluster = [NVSSHDataMiner getCluster];
    NSLog(@"%@",cluster.report.softwareAssessment.recommendation);
    
    [self.lblClusterName setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTREGULAR size:12]];
    self.lblClusterName.text = [NSString stringWithFormat:@"Cluster Name: %@",cluster.name];
    
    [self.lblOrganizationName setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTREGULAR size:12]];
    
    if(self.scrollVwCurrentEnv == nil)
    {
    self.scrollVwCurrentEnv = [[UIScrollView alloc] initWithFrame:CGRectMake(83, 150, 581, 595)];
    [self.scrollVwCurrentEnv setBackgroundColor:[UIColor clearColor]];
        self.scrollVwCurrentEnv.tag = 22;
    [self addSubview:self.scrollVwCurrentEnv];
    
    UILabel *lblCucm = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 70, 40)];
    lblCucm.text = @"CUCM";
        lblCucm.tag = 24;
    [lblCucm setTextColor:[UIColor blackColor]];
    [lblCucm setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTBOLD size:14.0]];
    [lblCucm setBackgroundColor:[UIColor clearColor]];
    [self.scrollVwCurrentEnv addSubview:lblCucm];
    
    UILabel *lblSoftware = [[UILabel alloc] initWithFrame:CGRectMake(190, 0, 80, 40)];
    lblSoftware.text = @"Software";
        lblSoftware.tag = 26;
    [lblSoftware setTextColor:[UIColor blackColor]];
    [lblSoftware setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
    [lblSoftware setBackgroundColor:[UIColor clearColor]];
    [self.scrollVwCurrentEnv addSubview:lblSoftware];
    
    UILabel *lblSoftwareValue = [[UILabel alloc] initWithFrame:CGRectMake(395, 0, 80, 40)];
        lblSoftwareValue.tag = 25;
    lblSoftwareValue.text =  [NSString stringWithFormat:@"%@", cluster.report.clusterVersion];
    [lblSoftwareValue setTextColor:[UIColor blackColor]];
    [lblSoftwareValue setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
    [lblSoftwareValue setBackgroundColor:[UIColor clearColor]];
    [self.scrollVwCurrentEnv addSubview:lblSoftwareValue];
    
    UIImageView *vwLine1 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 550, 1)];
        vwLine1.tag = 23;
    [vwLine1 setBackgroundColor:[UIColor grayColor]];
    [self.scrollVwCurrentEnv addSubview:vwLine1];
    
    UILabel *lblHardware = [[UILabel alloc] initWithFrame:CGRectMake(190, 30, 80, 40)];
    lblHardware.text = @"Hardware";
        lblHardware.tag = 26;
    [lblHardware setTextColor:[UIColor blackColor]];
    [lblHardware setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
    [lblHardware setBackgroundColor:[UIColor clearColor]];
    [self.scrollVwCurrentEnv addSubview:lblHardware];
    
    UIImageView *vwLine2 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 60, 550, 1)];
        vwLine2.tag = 23;
    [vwLine2 setBackgroundColor:[UIColor grayColor]];
    [self.scrollVwCurrentEnv addSubview:vwLine2];
    
    NSArray *arrServerAssessmentType = cluster.report.serversAssessments;
    
    for (int i = 0; i < [arrServerAssessmentType count]; i++) {
        
        NVServerAssessment *serverAssessment = [arrServerAssessmentType objectAtIndex:i];
        
        UILabel *lblType = [[UILabel alloc] initWithFrame:CGRectMake(210, (i*30)+70, 100, 20)];
        [lblType setBackgroundColor:[UIColor redColor]];
        lblType.text = [NSString stringWithFormat:@"%@", serverAssessment.type];
        [lblType setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
        [lblType setBackgroundColor:[UIColor clearColor]];
        [self.scrollVwCurrentEnv addSubview:lblType];
        
        UILabel *lblTypeModel= [[UILabel alloc] initWithFrame:CGRectMake(395, (i*30)+70, 100, 20)];
        lblTypeModel.tag = 25;
        [lblTypeModel setBackgroundColor:[UIColor redColor]];
        lblTypeModel.text = [NSString stringWithFormat:@"%@", serverAssessment.model];
        [lblTypeModel setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
        [lblTypeModel setBackgroundColor:[UIColor clearColor]];
        [self.scrollVwCurrentEnv addSubview:lblTypeModel];
        
        UIImageView *vwLine = [[UIImageView alloc] initWithFrame:CGRectMake(20, (i*30)+90, 550, 1)];
        vwLine.tag = 23;
        [vwLine setBackgroundColor:[UIColor grayColor]];
        [self.scrollVwCurrentEnv addSubview:vwLine];
    }
    
    UILabel *lblEndPoints = [[UILabel alloc] initWithFrame:CGRectMake(20, ([arrServerAssessmentType count]*30)+60, 80, 40)];
    [lblEndPoints setText:@"Endpoints"];
        lblEndPoints.tag = 24;
    [lblEndPoints setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTBOLD size:14.0]];
    [lblEndPoints setBackgroundColor:[UIColor clearColor]];
    [self.scrollVwCurrentEnv addSubview:lblEndPoints];
    
    NSInteger iYaxis = ([arrServerAssessmentType count]*30)+70;
    
    NSArray *arrTypeEndPoints = cluster.endpoints;
    
    for (int i = 0; i < [arrTypeEndPoints count]; i++) {
        
        NVEndpoint *endpoint = [arrTypeEndPoints objectAtIndex:i];
        
        UILabel *lblQuantity = [[UILabel alloc] initWithFrame:CGRectMake(190, (i*30)+iYaxis, 100, 20)];
        [lblQuantity setBackgroundColor:[UIColor redColor]];
        lblQuantity.tag = 26;
        lblQuantity.text = [NSString stringWithFormat:@"Quantity %i", endpoint.quantity];
        [lblQuantity setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
        [lblQuantity setBackgroundColor:[UIColor clearColor]];
        [self.scrollVwCurrentEnv addSubview:lblQuantity];
        
        UILabel *lblQuantityModel= [[UILabel alloc] initWithFrame:CGRectMake(395, (i*30)+iYaxis, 100, 20)];
        [lblQuantityModel setBackgroundColor:[UIColor redColor]];
        lblQuantityModel.tag = 25;
        if ([[NSString stringWithFormat:@"%@", endpoint.model] isEqualToString:@"(null)"]) {
            endpoint.model = @"-";
        }
        
        lblQuantityModel.text = [NSString stringWithFormat:@"%@", endpoint.model];
        [lblQuantityModel setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
        [lblQuantityModel setBackgroundColor:[UIColor clearColor]];
        [self.scrollVwCurrentEnv addSubview:lblQuantityModel];
        
        UIImageView *vwLine = [[UIImageView alloc] initWithFrame:CGRectMake(20, (i*30)+iYaxis+20, 550, 1)];
        vwLine.tag = 23;
        [vwLine setBackgroundColor:[UIColor grayColor]];
        [self.scrollVwCurrentEnv addSubview:vwLine];
    }
    
    UILabel *lblUnityConnections = [[UILabel alloc] initWithFrame:CGRectMake(20, (([arrServerAssessmentType count]+[arrTypeEndPoints count])*30)+60, 120, 40)];
    [lblUnityConnections setText:@"Unity Connection"];
        lblUnityConnections.tag = 24;
    [lblUnityConnections setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTBOLD size:14.0]];
    [lblUnityConnections setBackgroundColor:[UIColor clearColor]];
    [self.scrollVwCurrentEnv addSubview:lblUnityConnections];
    
    UILabel *lblUnitySoftware = [[UILabel alloc] initWithFrame:CGRectMake(190, (([arrServerAssessmentType count]+[arrTypeEndPoints count])*30)+60, 80, 40)];
    lblUnitySoftware.text = @"Software";
        lblUnitySoftware.tag = 26;
    [lblUnitySoftware setTextColor:[UIColor blackColor]];
    [lblUnitySoftware setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
    [lblUnitySoftware setBackgroundColor:[UIColor clearColor]];
    [self.scrollVwCurrentEnv addSubview:lblUnitySoftware];
    
    UILabel *lblUnitySoftwareValue = [[UILabel alloc] initWithFrame:CGRectMake(395, (([arrServerAssessmentType count]+[arrTypeEndPoints count])*30)+60, 80, 40)];
    lblUnitySoftwareValue.text =  [NSString stringWithFormat:@"8.0.(3)"]; // Use this hard core value because there is no variable found in your data model class.
        lblUnitySoftwareValue.tag = 25;
    [lblUnitySoftwareValue setTextColor:[UIColor blackColor]];
    [lblUnitySoftwareValue setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
    [lblUnitySoftwareValue setBackgroundColor:[UIColor clearColor]];
    [self.scrollVwCurrentEnv addSubview:lblUnitySoftwareValue];
    
    UIImageView *vwLine3 = [[UIImageView alloc] initWithFrame:CGRectMake(20, (([arrServerAssessmentType count]+[arrTypeEndPoints count])*30)+90, 550, 1)];
        vwLine3.tag = 23;
    [vwLine3 setBackgroundColor:[UIColor grayColor]];
    [self.scrollVwCurrentEnv addSubview:vwLine3];
    
    UILabel *lblUnityHardware = [[UILabel alloc] initWithFrame:CGRectMake(190, (([arrServerAssessmentType count]+[arrTypeEndPoints count])*30)+90, 80, 40)];
    lblUnityHardware.text = @"Hardware";
        lblUnityHardware.tag = 26;
    [lblUnityHardware setTextColor:[UIColor blackColor]];
    [lblUnityHardware setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
    [lblUnityHardware setBackgroundColor:[UIColor clearColor]];
    [self.scrollVwCurrentEnv addSubview:lblUnityHardware];
    
    UIImageView *vwLine4 = [[UIImageView alloc] initWithFrame:CGRectMake(20, (([arrServerAssessmentType count]+[arrTypeEndPoints count])*30)+120, 550, 1)];
        vwLine4.tag = 23;
    [vwLine4 setBackgroundColor:[UIColor grayColor]];
    [self.scrollVwCurrentEnv addSubview:vwLine4];
    
    
    
    NSInteger iYaxisUnity = (([arrServerAssessmentType count]+[arrTypeEndPoints count])*30)+120;
    
    NSArray *arrUnity = cluster.servers;
    
    for (int i = 0; i < [arrUnity count]; i++) {
        
        NVServer *server = [arrUnity objectAtIndex:i];
        
        UILabel *lblServer = [[UILabel alloc] initWithFrame:CGRectMake(210, (i*30)+iYaxisUnity+10, 100, 20)];
        [lblServer setBackgroundColor:[UIColor redColor]];
        lblServer.text = [NSString stringWithFormat:@"Server %i", server.unityServer];
        [lblServer setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
        [lblServer setBackgroundColor:[UIColor clearColor]];
        [self.scrollVwCurrentEnv addSubview:lblServer];
        
        UILabel *lblServerModel= [[UILabel alloc] initWithFrame:CGRectMake(395, (i*30)+iYaxisUnity+10, 100, 20)];
        
        if ([[NSString stringWithFormat:@"%@", server.unityModel] isEqualToString:@"(null)"]) {
            server.unityModel = @"-";
        }
        
        lblServerModel.text = [NSString stringWithFormat:@"%@", server.unityModel];
        lblServerModel.tag = 25;
        [lblServerModel setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
        [lblServerModel setBackgroundColor:[UIColor clearColor]];
        [self.scrollVwCurrentEnv addSubview:lblServerModel];
        
        UIImageView *vwLine = [[UIImageView alloc] initWithFrame:CGRectMake(20, (i*30)+iYaxisUnity+30, 550, 1)];
        vwLine.tag = 23;
        [vwLine setBackgroundColor:[UIColor grayColor]];
        [self.scrollVwCurrentEnv addSubview:vwLine];
    }
    
    self.scrollVwCurrentEnv.contentSize = CGSizeMake(581, ([arrServerAssessmentType count]+[arrTypeEndPoints count]+[arrUnity count])*50);
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
-(void)expandCurrentEnvironmentView
{
    self.btnBack.hidden = NO;
    for (UIView *innerControllerView in [self subviews])
    {
        if ([innerControllerView isKindOfClass:[UIImageView class]])
        {
             if(innerControllerView.tag == 14)
            {
                ((UIImageView *)innerControllerView).frame = CGRectMake(50, innerControllerView.frame.origin.y, 950, innerControllerView.frame.size.height);
            }

        }//if end.
        
        
        else if ([innerControllerView isKindOfClass:[UIButton class]])
        {
            if(innerControllerView.tag == 16)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(20, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 17)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(950, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }

        }//else if end.
        
        else if ([innerControllerView isKindOfClass:[UILabel class]])
        {
            if(innerControllerView.tag == 15)
            {
                ((UILabel *)innerControllerView).center = CGPointMake(512, 30);
            }
            if(innerControllerView.tag == 18)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(70, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 19)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(793, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 20)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(759, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }//else if end.
        
        else if ([innerControllerView isKindOfClass:[UIScrollView class]])
        {
            if(innerControllerView.tag == 22)
            {
                ((UIScrollView *)innerControllerView).frame = CGRectMake(50, innerControllerView.frame.origin.y, 916, innerControllerView.frame.size.height);
                
                UIScrollView *scrollView = (UIScrollView *)innerControllerView;
                
                for (UIView *innerScrollView in [scrollView subviews])
                {
                    if ([innerScrollView isKindOfClass:[UILabel class]])
                    {
                        if(innerScrollView.tag == 24)
                        {
                        
                        }
                        else if (innerScrollView.tag == 25)
                        {
                            ((UILabel *)innerScrollView).frame = CGRectMake( 795, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                        else if (innerScrollView.tag == 26)
                        {
                            ((UILabel *)innerScrollView).frame = CGRectMake(390, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                        else
                        {
                            ((UILabel *)innerScrollView).frame = CGRectMake(410, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                    }
                    
                    if ([innerScrollView isKindOfClass:[UIImageView class]])
                    {
                        if(innerScrollView.tag == 23)
                        {
                        ((UIImageView *)innerScrollView).frame = CGRectMake(innerScrollView.frame.origin.x, innerScrollView.frame.origin.y, 900, innerScrollView.frame.size.height);
                        }
                    }

                }
            }
        }//if end.
        
        else if ([innerControllerView isKindOfClass:[UIView class]])
        {
            if(innerControllerView.tag == 21)
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
-(void)collapseCurrentEnvironmentView
{
    self.btnBack.hidden = YES;
    
    for (UIView *innerControllerView in [self subviews])
    {
        if ([innerControllerView isKindOfClass:[UIImageView class]])
        {
            if(innerControllerView.tag == 14)
            {
                ((UIImageView *)innerControllerView).frame = CGRectMake(83, innerControllerView.frame.origin.y, 581, innerControllerView.frame.size.height);
            }
            
        }//if end.
        

        
        if ([innerControllerView isKindOfClass:[UILabel class]])
        {
            if(innerControllerView.tag == 15)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(176, 20, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 18)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(102, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 19)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(473, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 20)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(438, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }

        }
        
        else if ([innerControllerView isKindOfClass:[UIButton class]])
        {
            if(innerControllerView.tag == 16)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(20, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 17)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(624, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }
        
        else if ([innerControllerView isKindOfClass:[UIScrollView class]])
        {
            if(innerControllerView.tag == 22)
            {
                ((UIScrollView *)innerControllerView).frame = CGRectMake(83, 150, 581, 595);
                
                UIScrollView *scrollView = (UIScrollView *)innerControllerView;
                
                for (UIView *innerScrollView in [scrollView subviews])
                {
                    if ([innerScrollView isKindOfClass:[UILabel class]])
                    {
                        if(innerScrollView.tag == 24)
                        {
                            
                        }
                        else if (innerScrollView.tag == 25)
                        {
                            ((UILabel *)innerScrollView).frame = CGRectMake(395, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                        else if (innerScrollView.tag == 26)
                        {
                            ((UILabel *)innerScrollView).frame = CGRectMake(190, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                        else
                        {
                            ((UILabel *)innerScrollView).frame = CGRectMake(210, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                    }
                    
                    if ([innerScrollView isKindOfClass:[UIImageView class]])
                    {
                        if(innerScrollView.tag == 23)
                        {
                            ((UIImageView *)innerScrollView).frame = CGRectMake(20, innerScrollView.frame.origin.y, 550, 1);
                        }
                    }
                }
            }
        }//if end.
        
        else if ([innerControllerView isKindOfClass:[UIView class]])
        {
            if(innerControllerView.tag == 21)
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

///***********************************************************************************************************
// * Method Name							: saveBtnTapEvent:(id)sender
// * Description							: Method to Save User Created data.
// * @Param								: sender.
// * @return							    : IBAction.
// * Modification Log
// * Date 								Author 										Description
// * ---------------------------------------------------------------------------------------------------------
// * 11/4/2013							FXBytes									Created
// ***********************************************************************************************************/
//-(IBAction)saveBtnTapEvent:(id)sender
//{
//    self.vwPopUp.hidden = NO;
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Under Development." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//    [alert show];
//}

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
