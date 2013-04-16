//
//  RecommendationView.m
//  DriveTo9
//
//  Created by Rahul Soni on 4/12/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "RecommendationView.h"
#import "ApplicationMacros.h"
#import "ViewManager.h"
#import "AppDelegate.h"
#import "NVServerAssessment.h"
#import "PDFViewController.h"

@implementation RecommendationView

@synthesize scrollVwRecommendation;

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
    self.lblHeader.text = @"Recommendation";
    
    [self.btnBack.titleLabel setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:12.0]];
    [self.btnBack setTitle:@"Back" forState:UIControlStateNormal];
    
    NVCUCMCluster *cluster = [NVSSHDataMiner getCluster];
    
    [self.lblClusterName setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTREGULAR size:12]];
    self.lblClusterName.text = [NSString stringWithFormat:@"Cluster Name: %@",cluster.name];
    
    [self.lblOrganizationName setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTREGULAR size:12]];
    
    [self.lblViewName setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:20]];
    self.lblViewName.text = @"Recommendation";
    
    [self.lblDescription setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14]];
    
    NSArray *arrServerAssessmentType;
    NSArray *arrEndPoints;
    
    if(self.scrollVwRecommendation == nil)
    {
        self.scrollVwRecommendation = [[UIScrollView alloc] initWithFrame:CGRectMake(83, 170, 581, 575)];
        [self.scrollVwRecommendation setBackgroundColor:[UIColor clearColor]];
        self.scrollVwRecommendation.tag = 22;
        [self addSubview:self.scrollVwRecommendation];

        self.singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapped)];
        self.singleTap.numberOfTapsRequired = 2;
        [self.scrollVwRecommendation addGestureRecognizer:self.singleTap];
        
        UILabel *lblCucmServer = [[UILabel alloc] initWithFrame:CGRectMake(25, 10, 140, 40)];
        lblCucmServer.text = @"CUCM Server";
        lblCucmServer.tag = 24;
        [lblCucmServer setTextColor:[UIColor blackColor]];
        [lblCucmServer setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTREGULAR size:18.0]];
        [lblCucmServer setBackgroundColor:[UIColor clearColor]];
        [self.scrollVwRecommendation addSubview:lblCucmServer];
        
        UIImageView *vwLine1 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 50, 550, 1)];
        vwLine1.tag = 23;
        [vwLine1 setBackgroundColor:[UIColor grayColor]];
        [self.scrollVwRecommendation addSubview:vwLine1];
        
        arrServerAssessmentType = cluster.report.serversAssessments;
        NSInteger iYaxis = 0;
        
        for (int i = 0; i < [arrServerAssessmentType count]; i++) {
            
            NVServerAssessment *serverAssessment = [arrServerAssessmentType objectAtIndex:i];
            
            //Assessment Message
            NSString *strAssessment = serverAssessment.assessment;// @"dksjfshfa fhdjfh fjhd adhfjfha dfhj fjdf jsdgf hafgsdhjfg dhjsf asgdfhjgf jafgdhj fadhjgfs asfgdhfga dfhghags fdhsgf dksjfshfa fhdjfh fjhd adhfjfha dfhj fjdf jsdgf hafgsdhjfg dhjsf asgdfhjgf jafgdhj fadhjgfs asfgdhfga dfhghags fdhsgf";//
            
            UILabel *lblTypeAssessment = [[UILabel alloc] init];
            UIFont *myFont = [UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:13.0];
            CGSize expectedLabelSize = [strAssessment sizeWithFont:myFont constrainedToSize:CGSizeMake(160,1000) lineBreakMode:lblTypeAssessment.lineBreakMode];
            
            //Assessment Next Message
            UILabel *lblNextMessage = [[UILabel alloc] init];
            
            NSString *strNextMsg = serverAssessment.nextStepMessage;
            
            CGSize expectedLabelSizeMsg = [strNextMsg sizeWithFont:myFont constrainedToSize:CGSizeMake(100,1000) lineBreakMode:lblNextMessage.lineBreakMode];
            
            if (expectedLabelSizeMsg.height > expectedLabelSize.height) {
                iYaxis = expectedLabelSizeMsg.height;
            } else {
                if (i == 0) {
                    iYaxis = 60;
                } else {
                    iYaxis = expectedLabelSize.height;
                }
            }
            
            
            NSLog(@"height - %f",expectedLabelSize.height);
            NSLog(@"iYaxis - %i",iYaxis);
            
            //Label Assessment Message
            lblTypeAssessment.frame = CGRectMake(260, (i*iYaxis)+iYaxis, 160, expectedLabelSize.height);
            lblTypeAssessment.tag = 26;
            lblTypeAssessment.text = [NSString stringWithFormat:@"%@", strAssessment];
            lblTypeAssessment.numberOfLines = 0.0;
            [lblTypeAssessment setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:13.0]];
            [lblTypeAssessment setBackgroundColor:[UIColor clearColor]];
            [self.scrollVwRecommendation addSubview:lblTypeAssessment];

            //Label Assessment Next Message
            lblNextMessage = [[UILabel alloc] initWithFrame:CGRectMake(430, (i*iYaxis)+iYaxis, 100, expectedLabelSizeMsg.height)];
            lblNextMessage.tag = 28;
            lblNextMessage.numberOfLines = 0.0;
            lblNextMessage.textAlignment = UITextAlignmentCenter;
            lblNextMessage.text = [NSString stringWithFormat:@"%@", serverAssessment.nextStepMessage];
            [lblNextMessage setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:13.0]];
            [lblNextMessage setBackgroundColor:[UIColor clearColor]];
            [self.scrollVwRecommendation addSubview:lblNextMessage];

            UILabel *lblType = [[UILabel alloc] initWithFrame:CGRectMake(25, (i*iYaxis)+iYaxis, 80, 20)];
            lblType.text = [NSString stringWithFormat:@"%@", serverAssessment.type];
            lblType.tag = 24;
            [lblType setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
            [lblType setBackgroundColor:[UIColor clearColor]];
            [self.scrollVwRecommendation addSubview:lblType];
            
            UILabel *lblTypeModel= [[UILabel alloc] initWithFrame:CGRectMake(120, (i*iYaxis)+iYaxis, 80, 20)];
            lblTypeModel.tag = 25;
            lblTypeModel.text = [NSString stringWithFormat:@"%@", serverAssessment.model];
            [lblTypeModel setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:13.0]];
            [lblTypeModel setBackgroundColor:[UIColor clearColor]];
            [self.scrollVwRecommendation addSubview:lblTypeModel];
            
            UIImageView *imgVwIcon = [[UIImageView alloc] initWithFrame:CGRectMake(210, (i*iYaxis)+iYaxis, 21, 21)];
            imgVwIcon.tag = 27;
            
            if ([serverAssessment.icon isEqualToString:@"GREEN"]) {
                [imgVwIcon setImage:[UIImage imageNamed:@"ok.png"]];
            } else {
                [imgVwIcon setImage:[UIImage imageNamed:@"alert.png"]];
            }
            
            [self.scrollVwRecommendation addSubview:imgVwIcon];
                        
            UIButton *btnArrow = [UIButton buttonWithType:UIButtonTypeCustom];
            btnArrow.frame = CGRectMake(540, (i*iYaxis)+iYaxis+20, 21, 21);
            btnArrow.tag = 28;
            [btnArrow addTarget:self action:@selector(btnArrowTapped:) forControlEvents:UIControlEventTouchUpInside];
            [btnArrow setTitle:serverAssessment.model forState:UIControlStateNormal];
            [btnArrow setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
            [btnArrow setImage:[UIImage imageNamed:@"blue.png"] forState:UIControlStateNormal];
            [self.scrollVwRecommendation addSubview:btnArrow];
            
            UIImageView *vwLine = [[UIImageView alloc] initWithFrame:CGRectMake(20, (i*iYaxis)+iYaxis+expectedLabelSize.height, 550, 1)];
            vwLine.tag = 23;
            [vwLine setBackgroundColor:[UIColor grayColor]];
            [self.scrollVwRecommendation addSubview:vwLine];
        }
        
        UILabel *lblEndPoints = [[UILabel alloc] initWithFrame:CGRectMake(25, ([arrServerAssessmentType count]*iYaxis)+iYaxis, 80, 40)];
        [lblEndPoints setText:@"Endpoints"];
        lblEndPoints.tag = 24;
        [lblEndPoints setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:13.0]];
        [lblEndPoints setBackgroundColor:[UIColor clearColor]];
        [self.scrollVwRecommendation addSubview:lblEndPoints];

        
        arrEndPoints = cluster.report.endpointsAssessments;
        
        NSInteger iYaxisEndPoints = ([arrServerAssessmentType count]*iYaxis)+iYaxis-60;
        
        for (int j = 0; j < [arrEndPoints count]; j ++) {
            NVEndpointAssessment *endPointAssessment = [arrEndPoints objectAtIndex:j];
            
            NSString *strAssessment = endPointAssessment.link;
            NSInteger iHeight = [strAssessment length];
            
            
            UILabel *lblTypeAssessment = [[UILabel alloc] init];
            CGSize maximumLabelSize = CGSizeMake(150,iHeight);
            UIFont *myFont = [UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:13.0];
            CGSize expectedLabelSize = [strAssessment sizeWithFont:myFont constrainedToSize:maximumLabelSize lineBreakMode:lblTypeAssessment.lineBreakMode];
            
            iYaxis = expectedLabelSize.height;
            
            lblTypeAssessment.frame = CGRectMake(260, (j*iYaxis)+iYaxis+iYaxisEndPoints, 160, expectedLabelSize.height);
            lblTypeAssessment.tag = 26;
            lblTypeAssessment.text = [NSString stringWithFormat:@"%@", endPointAssessment.link];
            lblTypeAssessment.numberOfLines = 0.0;
            [lblTypeAssessment setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:13.0]];
            [lblTypeAssessment setBackgroundColor:[UIColor clearColor]];
            [self.scrollVwRecommendation addSubview:lblTypeAssessment];
            
//            UILabel *lblType = [[UILabel alloc] initWithFrame:CGRectMake(25, (j*75)+iYaxis, 80, 20)];
//            lblType.text = [NSString stringWithFormat:@"%@", endPointAssessment.type];
//            lblType.tag = 24;
//            [lblType setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
//            [lblType setBackgroundColor:[UIColor clearColor]];
//            [self.scrollVwRecommendation addSubview:lblType];
            
            UILabel *lblTypeModel= [[UILabel alloc] initWithFrame:CGRectMake(120, (j*iYaxis)+iYaxis+iYaxisEndPoints, 80, 20)];
            lblTypeModel.tag = 25;
            
            if (endPointAssessment.model == nil) {
                endPointAssessment.model = @"-";
            }
            
            lblTypeModel.text = [NSString stringWithFormat:@"%@", endPointAssessment.model];
            [lblTypeModel setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:13.0]];
            [lblTypeModel setBackgroundColor:[UIColor clearColor]];
            [self.scrollVwRecommendation addSubview:lblTypeModel];
            
            UIImageView *imgVwIcon = [[UIImageView alloc] initWithFrame:CGRectMake(210, (j*iYaxis)+iYaxis+iYaxisEndPoints, 21, 21)];
            imgVwIcon.tag = 27;
            
            if ([endPointAssessment.icon isEqualToString:@"GREEN"]) {
                [imgVwIcon setImage:[UIImage imageNamed:@"ok.png"]];
            } else {
                [imgVwIcon setImage:[UIImage imageNamed:@"alert.png"]];
            }
            
            [self.scrollVwRecommendation addSubview:imgVwIcon];
            
            UILabel *lblNextMessage = [[UILabel alloc] initWithFrame:CGRectMake(430, (j*iYaxis)+iYaxis+iYaxisEndPoints, 100, 30)];
            lblNextMessage.tag = 28;
            lblNextMessage.numberOfLines = 0.0;
            lblNextMessage.textAlignment = UITextAlignmentCenter;
            lblNextMessage.text = [NSString stringWithFormat:@"%i", endPointAssessment.count];
            [lblNextMessage setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:13.0]];
            [lblNextMessage setBackgroundColor:[UIColor clearColor]];
            [self.scrollVwRecommendation addSubview:lblNextMessage];
//
//            UIButton *btnArrow = [UIButton buttonWithType:UIButtonTypeCustom];
//            btnArrow.frame = CGRectMake(550, (j*75)+iYaxis+20, 21, 21);
//            [btnArrow addTarget:self action:@selector(btnTapped) forControlEvents:UIControlEventTouchUpInside];
//            [btnArrow setImage:[UIImage imageNamed:@"blue.png"] forState:UIControlStateNormal];
//            [self.scrollVwRecommendation addSubview:btnArrow];
        }
        
        UIImageView *vwLine = [[UIImageView alloc] initWithFrame:CGRectMake(20, ([arrEndPoints count]*iYaxis)+iYaxis+iYaxisEndPoints , 550, 1)];
        vwLine.tag = 23;
        [vwLine setBackgroundColor:[UIColor grayColor]];
        [self.scrollVwRecommendation addSubview:vwLine];

        
        UILabel *lblUnityConnections = [[UILabel alloc] initWithFrame:CGRectMake(25, (([arrEndPoints count])*iYaxis)+iYaxis+iYaxisEndPoints, 120, 40)];
        [lblUnityConnections setText:@"Server 1"];
        lblUnityConnections.tag = 24;
        [lblUnityConnections setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
        [lblUnityConnections setBackgroundColor:[UIColor clearColor]];
        [self.scrollVwRecommendation addSubview:lblUnityConnections];
        
        UIImageView *imgVwIcon = [[UIImageView alloc] initWithFrame:CGRectMake(210, ([arrEndPoints count]*iYaxis)+iYaxis +iYaxisEndPoints+7, 21, 21)];
        imgVwIcon.tag = 27;
        
//        if ([serverAssessment.icon isEqualToString:@"GREEN"]) {
            [imgVwIcon setImage:[UIImage imageNamed:@"ok.png"]];
//        } else {
//            [imgVwIcon setImage:[UIImage imageNamed:@"alert.png"]];
//        }
        
        [self.scrollVwRecommendation addSubview:imgVwIcon];

        
        UILabel *lblUnityModel = [[UILabel alloc] initWithFrame:CGRectMake(120, (([arrEndPoints count])*iYaxis)+iYaxis+iYaxisEndPoints, 100, 40)];
        lblUnityModel.text = @"MCS-7845-I3"; // Use this hard core value because there is no variable found in your data model class.
        lblUnityModel.tag = 25;
        [lblUnityModel setTextColor:[UIColor blackColor]];
        [lblUnityModel setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:13.0]];
        [lblUnityModel setBackgroundColor:[UIColor clearColor]];
        [self.scrollVwRecommendation addSubview:lblUnityModel];


        UILabel *lblServerAssessment = [[UILabel alloc] initWithFrame:CGRectMake(260, (([arrEndPoints count])*iYaxis)+iYaxis+iYaxisEndPoints, 180, 40)];
        lblServerAssessment.text =  [NSString stringWithFormat:@"This hardware is compatible"]; // Use this hard core value because there is no variable found in your data model class.
        lblServerAssessment.tag = 26;
        [lblServerAssessment setTextColor:[UIColor blackColor]];
        [lblServerAssessment setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
        [lblServerAssessment setBackgroundColor:[UIColor clearColor]];
        [self.scrollVwRecommendation addSubview:lblServerAssessment];

        UIImageView *vwLine3 = [[UIImageView alloc] initWithFrame:CGRectMake(20, (([arrEndPoints count])*iYaxis)+iYaxisEndPoints+iYaxis+50, 550, 1)];
        vwLine3.tag = 23;
        [vwLine3 setBackgroundColor:[UIColor grayColor]];
        [self.scrollVwRecommendation addSubview:vwLine3];
        
        UILabel *lblGeneral = [[UILabel alloc] initWithFrame:CGRectMake(25, (([arrEndPoints count])*iYaxis)+iYaxis+iYaxisEndPoints+50, 80, 40)];
        lblGeneral.text = @"General";
        lblGeneral.tag = 24;
        [lblGeneral setTextColor:[UIColor blackColor]];
        [lblGeneral setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
        [lblGeneral setBackgroundColor:[UIColor clearColor]];
        [self.scrollVwRecommendation addSubview:lblGeneral];
        
        UIImageView *imgVwIconGeneral = [[UIImageView alloc] initWithFrame:CGRectMake(210, ([arrEndPoints count]*iYaxis)+iYaxis +iYaxisEndPoints+60, 21, 21)];
        imgVwIconGeneral.tag = 27;
        
        if ([cluster.report.generalAssessment.icon isEqualToString:@"INFO"]) {
            [imgVwIconGeneral setImage:[UIImage imageNamed:@"ok.png"]];
        } else {
            [imgVwIconGeneral setImage:[UIImage imageNamed:@"alert.png"]];
        }
        
        [self.scrollVwRecommendation addSubview:imgVwIconGeneral];

        
        UILabel *lblGeneralMesg = [[UILabel alloc] init];
        
        NSString *strNextMsg = cluster.report.generalAssessment.message;
        NSInteger iHeightMsg = [strNextMsg length];
        
        UIFont *myFont = [UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0];
        
        CGSize maximumLabelSizeMsg = CGSizeMake(200,iHeightMsg);
        CGSize expectedLabelSizeMsg = [strNextMsg sizeWithFont:myFont constrainedToSize:maximumLabelSizeMsg lineBreakMode:lblGeneralMesg.lineBreakMode];

        
        lblGeneralMesg.frame = CGRectMake(260, ([arrEndPoints count]*iYaxis)+iYaxis+iYaxisEndPoints+60, 200, expectedLabelSizeMsg.height);
        lblGeneralMesg.text = cluster.report.generalAssessment.message;
        lblGeneralMesg.tag = 26;
        [lblGeneralMesg setTextColor:[UIColor blackColor]];
        [lblGeneralMesg setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:14.0]];
        [lblGeneralMesg setBackgroundColor:[UIColor clearColor]];
        [self.scrollVwRecommendation addSubview:lblGeneralMesg];

        self.scrollVwRecommendation.contentSize = CGSizeMake(581, ([arrServerAssessmentType count]+[arrEndPoints count])*120);
    }    
    
    
}

#pragma mark - Arrow button tapped
/***********************************************************************************************************
 * Method Name							: - (void)btnArrowTapped:(id)sender
 * Description							: Method is called when the arrow button is tapped
 * @Param							  id: sender.
 * @return							    : void.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 15/4/2013							FXBytes									Created
 ***********************************************************************************************************/

- (void)btnArrowTapped:(id)sender {
    UIButton *btnTapped = (UIButton *)sender;
    
    UIView *vw = (UIView *)[self.scrollVwRecommendation viewWithTag:123];
    
    if (vw != nil) {
        self.singleTap.numberOfTapsRequired = 2;
        
        [vw removeFromSuperview];
        vw = nil;
    } else {
        UIView *vwPopForTable = [[UIView alloc] initWithFrame:CGRectMake(btnTapped.frame.origin.x - 192, btnTapped.frame.origin.y+15, 250, 375)];
        vwPopForTable.backgroundColor = [UIColor clearColor];
        vwPopForTable.tag = 123;
        [self.scrollVwRecommendation addSubview:vwPopForTable];
        [self.scrollVwRecommendation bringSubviewToFront:vwPopForTable];
        
        UIImageView *imgVwPopUp = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 250, 375)];
        imgVwPopUp.image = [UIImage imageNamed:@"popupBig.png"];
        [vwPopForTable addSubview:imgVwPopUp];
        
        UIButton *btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
        btnOne.backgroundColor = [UIColor clearColor];
        [btnOne setTitle:@"UCS C200" forState:UIControlStateNormal];
        [btnOne setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [btnOne addTarget:self action:@selector(pdfBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
        btnOne.frame = CGRectMake(32, 88, 186, 30);
        [vwPopForTable addSubview:btnOne];
        
        UILabel *lblTitleOne = [[UILabel alloc] initWithFrame:CGRectMake(50, 88, 186, 30)];
        lblTitleOne.backgroundColor = [UIColor clearColor];
        lblTitleOne.textColor = [UIColor blackColor];
        lblTitleOne.text = @"UCS C200";
        [lblTitleOne setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:14.0]];
        [vwPopForTable addSubview:lblTitleOne];

        UIButton *btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
        btnTwo.backgroundColor = [UIColor clearColor];
        [btnTwo setTitle:@"UCS C300" forState:UIControlStateNormal];
        [btnTwo setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [btnTwo addTarget:self action:@selector(pdfBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
        btnTwo.frame = CGRectMake(32, 120, 186, 30);
        [vwPopForTable addSubview:btnTwo];
        
        UILabel *lblTitleTwo = [[UILabel alloc] initWithFrame:CGRectMake(50, 120, 186, 30)];
        lblTitleTwo.backgroundColor = [UIColor clearColor];
        lblTitleTwo.textColor = [UIColor blackColor];
        lblTitleTwo.text = @"UCS C300";
        [lblTitleTwo setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:14.0]];
        [vwPopForTable addSubview:lblTitleTwo];

        UIButton *btnThree = [UIButton buttonWithType:UIButtonTypeCustom];
        btnThree.backgroundColor = [UIColor clearColor];
        [btnThree setTitle:@"UCS B200" forState:UIControlStateNormal];
        [btnThree setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [btnThree addTarget:self action:@selector(pdfBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
        btnThree.frame = CGRectMake(32, 155, 186, 30);
        [vwPopForTable addSubview:btnThree];
        
        UILabel *lblTitleThree = [[UILabel alloc] initWithFrame:CGRectMake(50, 155, 186, 30)];
        lblTitleThree.backgroundColor = [UIColor clearColor];
        lblTitleThree.textColor = [UIColor blackColor];
        lblTitleThree.text = @"UCS B200";
        [lblTitleThree setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:14.0]];
        [vwPopForTable addSubview:lblTitleThree];

        UIButton *btnFour = [UIButton buttonWithType:UIButtonTypeCustom];
        btnFour.backgroundColor = [UIColor clearColor];
        [btnFour setTitle:@"UCS B300" forState:UIControlStateNormal];
        [btnFour setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [btnFour addTarget:self action:@selector(pdfBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
        btnFour.frame = CGRectMake(32, 190, 186, 30);
        [vwPopForTable addSubview:btnFour];
        
        UILabel *lblTitleFour = [[UILabel alloc] initWithFrame:CGRectMake(50, 190, 186, 30)];
        lblTitleFour.backgroundColor = [UIColor clearColor];
        lblTitleFour.textColor = [UIColor blackColor];
        lblTitleFour.text = @"UCS B300";
        [lblTitleFour setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:14.0]];
        [vwPopForTable addSubview:lblTitleFour];

        UIButton *btnFive = [UIButton buttonWithType:UIButtonTypeCustom];
        btnFive.backgroundColor = [UIColor clearColor];
        [btnFive setTitle:@"BE 6000" forState:UIControlStateNormal];
        [btnFive setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [btnFive addTarget:self action:@selector(pdfBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
        btnFive.frame = CGRectMake(32, 225, 186, 30);
        [vwPopForTable addSubview:btnFive];
        [vwPopForTable bringSubviewToFront:btnFive];
        
        UILabel *lblTitleFive = [[UILabel alloc] initWithFrame:CGRectMake(50, 225, 186, 30)];
        lblTitleFive.backgroundColor = [UIColor clearColor];
        lblTitleFive.textColor = [UIColor blackColor];
        lblTitleFive.text = @"BE 6000";
        [lblTitleFive setFont:[UIFont fontWithName:FONTNAME_HELVETICANEUEBOLD size:14.0]];
        [vwPopForTable addSubview:lblTitleFive];
        
        UILabel *lblMessage = [[UILabel alloc] initWithFrame:CGRectMake(32, 290, 190, 50)];
        lblMessage.text = @"Please contact your Cisco Sales Rep for additional details";
        [lblMessage setFont:[UIFont fontWithName:FONTNAME_CISCOSANSTTEXTRALIGHT size:12.0]];
            lblMessage.textAlignment = UITextAlignmentCenter;
        lblMessage.numberOfLines = 0;
        lblMessage.backgroundColor = [UIColor clearColor];

        [vwPopForTable addSubview:lblMessage];

        self.scrollVwRecommendation.contentOffset = CGPointMake(0, btnTapped.frame.origin.y-100);
    }
}

#pragma mark - PDF btn tapped

/***********************************************************************************************************
 * Method Name							: pdfBtnTapped
 * Description							: Method is called when the pop up button is tapped
 * @Param						UIButton: btn.
 * @return							    : void.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 15/4/2013							FXBytes									Created
 ***********************************************************************************************************/

- (void)pdfBtnTapped:(UIButton *)btn {
    ViewManager *manager = [((AppDelegate*)[UIApplication sharedApplication].delegate) manager];
	if([manager canSwitchToViewWithId:PDFVIEWCONTROLLER])
	{
		[manager switchToViewWithId:PDFVIEWCONTROLLER];
        
        PDFViewController *pdfViewConroller = (PDFViewController *)[manager activeViewController];
        [pdfViewConroller btnTappedForPdf:btn];
        self.singleTap.numberOfTapsRequired = 1;
//        [btn addTarget:nil action:@selector(btnTappedForPdf:) forControlEvents:UIControlEventTouchUpInside];
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
-(void)expandRecommendationView
{
    self.btnBack.hidden = NO;
    for (UIView *innerControllerView in [self subviews])
    {
        if ([innerControllerView isKindOfClass:[UIImageView class]])
        {
            if(innerControllerView.tag == 43)
            {
                ((UIImageView *)innerControllerView).frame = CGRectMake(50, innerControllerView.frame.origin.y, 950, innerControllerView.frame.size.height);
            }
            
        }//if end.
        
        else if ([innerControllerView isKindOfClass:[UIButton class]])
        {
            if(innerControllerView.tag == 45)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(20, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 44)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(950, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            
        }//else if end.
        
        else if ([innerControllerView isKindOfClass:[UILabel class]])
        {
            if(innerControllerView.tag == 46)
            {
                ((UILabel *)innerControllerView).center = CGPointMake(512, 30);
            }
            if(innerControllerView.tag == 47)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(75, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 19)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(790, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 20)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(750, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }//else if end.
//-------------------------      
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
                            ((UILabel *)innerScrollView).frame = CGRectMake(100, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                        else if (innerScrollView.tag == 26)
                        {
                            ((UILabel *)innerScrollView).frame = CGRectMake(350, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                        else if (innerScrollView.tag == 28)
                        {
                            ((UILabel *)innerScrollView).frame = CGRectMake(650, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                    }
                    
                    else if ([innerScrollView isKindOfClass:[UIImageView class]])
                    {
                        if(innerScrollView.tag == 23)
                        {
                            ((UIImageView *)innerScrollView).frame = CGRectMake(innerScrollView.frame.origin.x, innerScrollView.frame.origin.y, 890, innerScrollView.frame.size.height);
                        }
                        else if (innerScrollView.tag == 28)
                        {
                            ((UIImageView *)innerScrollView).frame = CGRectMake(300, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                    }
                    
                    else if ([innerScrollView isKindOfClass:[UIButton class]])
                    {
                        if(innerScrollView.tag == 28)
                        {
                            ((UIButton *)innerScrollView).frame = CGRectMake(850, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                    }
                    
                    else if ([innerScrollView isKindOfClass:[UIView class]])
                    {
                        if(innerScrollView.tag == 123)
                        {
                            ((UIView *)innerScrollView).frame = CGRectMake(850 - 192, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                    }
                }
            }
        }//if end.
//-------------------------
        
        else if ([innerControllerView isKindOfClass:[UIView class]])
        {
            if(innerControllerView.tag == 48)
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
-(void)collapseRecommendationView
{
    self.btnBack.hidden = YES;
    
    for (UIView *innerControllerView in [self subviews])
    {
        if ([innerControllerView isKindOfClass:[UIImageView class]])
        {
            if(innerControllerView.tag == 43)
            {
                ((UIImageView *)innerControllerView).frame = CGRectMake(83, innerControllerView.frame.origin.y, 581, innerControllerView.frame.size.height);
            }
            
        }//if end.
        
        if ([innerControllerView isKindOfClass:[UILabel class]])
        {
            if(innerControllerView.tag == 46)
            {
                ((UILabel *)innerControllerView).frame = CGRectMake(176, 20, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 47)
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
            if(innerControllerView.tag == 45)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(20, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
            if(innerControllerView.tag == 44)
            {
                ((UIButton *)innerControllerView).frame = CGRectMake(624, innerControllerView.frame.origin.y, innerControllerView.frame.size.width, innerControllerView.frame.size.height);
            }
        }
        
        //-------------------------
        else if ([innerControllerView isKindOfClass:[UIScrollView class]])
        {
            if(innerControllerView.tag == 22)
            {
                ((UIScrollView *)innerControllerView).frame = CGRectMake(83, innerControllerView.frame.origin.y, 581, innerControllerView.frame.size.height);
                
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
                            ((UILabel *)innerScrollView).frame = CGRectMake(120, innerScrollView.frame.origin.y, 80, innerScrollView.frame.size.height);
                        }
                        else if (innerScrollView.tag == 26)
                        {
                            ((UILabel *)innerScrollView).frame = CGRectMake(260, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                        else if (innerScrollView.tag == 28)
                        {
                            ((UILabel *)innerScrollView).frame = CGRectMake(430, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                    }
                    
                    else if ([innerScrollView isKindOfClass:[UIImageView class]])
                    {
                        if(innerScrollView.tag == 23)
                        {
                            ((UIImageView *)innerScrollView).frame = CGRectMake(20, innerScrollView.frame.origin.y, 550, innerScrollView.frame.size.height);
                        }
                        else if (innerScrollView.tag == 28)
                        {
                            ((UIImageView *)innerScrollView).frame = CGRectMake(300, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                    }
                    
                    else if ([innerScrollView isKindOfClass:[UIButton class]])
                    {
                        if(innerScrollView.tag == 28)
                        {
                            ((UIButton *)innerScrollView).frame = CGRectMake(540, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                    }
                    
                    else if ([innerScrollView isKindOfClass:[UIView class]])
                    {
                        if(innerScrollView.tag == 123)
                        {
                            ((UIView *)innerScrollView).frame = CGRectMake(348, innerScrollView.frame.origin.y, innerScrollView.frame.size.width, innerScrollView.frame.size.height);
                        }
                    }
                }
            }
        }//if end.
        //-------------------------

        
        else if ([innerControllerView isKindOfClass:[UIView class]])
        {
            if(innerControllerView.tag == 48)
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
    if(self.vwPopUp.hidden == YES)
        self.vwPopUp.hidden = NO;
    else
        self.vwPopUp.hidden = YES;
}

#pragma mark - Single tap on the scrollview
/***********************************************************************************************************
 * Method Name							: singleTap
 * Description							: Method to remove Popup from view.
 * @Param								: void.
 * @return							    : void.
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)singleTapped {
    if (self.singleTap.numberOfTapsRequired == 1) {
        self.singleTap.numberOfTapsRequired = 2;
    }
    UIView *vw = (UIView *)[self.scrollVwRecommendation viewWithTag:123];
    [vw removeFromSuperview];
    vw = nil;
}

//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    self.vwPopUp.hidden = YES;
//}

@end
