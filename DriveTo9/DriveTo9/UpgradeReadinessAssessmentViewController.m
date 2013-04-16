//
//  UpgradeReadinessAssessmentViewController.m
//  DriveTo9
//
//  Created by FxBytes on 05/04/2013.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "UpgradeReadinessAssessmentViewController.h"
#import "StartReadinessAssessmentView.h"
#import "MyAssessmentView.h"
#import "AppDelegate.h"
#import "SplitView.h"
#import "ApplicationMacros.h"

#import "CurrentEnvironmentViewController.h"
#import "SummaryView.h"
#import "MyAssessmentPDFView.h"

#import "MyAssessmentView.h"
#import "RecommendationView.h"
#import "UpgradeProceduresView.h"

#import "SaveView.h"

typedef enum
{
    kCurrentEnvironment = 1,
    kSummary ,
    kRecommendation ,
    kUpgradeProcedure,
}StartReadinessSubViewsID; // StartReadinessView subview's ID.

typedef enum
{
    kAssessment1 = 1,
    kAssessment2,
    kAssessment3,
    kAssessment4,
    kAssessment5,
}MyAssessmentSubViewsID; // MyAssessmentSubViewsID subview's ID.

//set here content id of views
#define STARTREADINESSASSESSMENT	@"1"
#define MYASSESSMENTVIEW		@"2"

@interface UpgradeReadinessAssessmentViewController ()
{
	UIView *tempSplitView;
	CGPoint beginPoint;
	CGPoint endPoint;
}

@property (nonatomic,strong) IBOutlet StartReadinessAssessmentView *startReadinessAssessmentView;
@property (nonatomic,strong) IBOutlet MyAssessmentView *myAssessmentView;
@property (nonatomic,strong) IBOutlet CurrentEnvironmentViewController *currentEnvironmentView;
@property (nonatomic,strong) IBOutlet SummaryView *summaryView;
@property (nonatomic,strong) IBOutlet RecommendationView *recommendationView;
@property (nonatomic,strong) IBOutlet UpgradeProceduresView *upgradeProceduresView;

@property (nonatomic,strong) IBOutlet SaveView *saveView;


@property (nonatomic,strong) IBOutlet MyAssessmentPDFView *myAssessmentPDFView;


@property (nonatomic,strong) SplitView *splitView;
@property (nonatomic,strong) NSString *strKey;
@end

@implementation UpgradeReadinessAssessmentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withContentId:(NSString *)contentId
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil withContentId:contentId];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	//set this view controller to actvate view controller
	ViewManager *manager = [((AppDelegate*)[UIApplication sharedApplication].delegate) manager];
	[manager setActiveViewController:self];
	
	//create split view.
	self.splitView = [[SplitView alloc] initWithFrame:CGRectMake(0, 0, 340, 728)];
	[self.view addSubview:self.splitView];
	[self.splitView setHeaderLabelText:@"Upgrade Readiness Assessment"];
    [self.splitView setControllerType:@"button" withImage:@"backbuttonbg.png"];
    
    [self.splitView addSplitComponentsWithTarget:self forDataFromPlist:@"Drive9"];
	
	//open views according to content id
	if ([self.contentId isEqualToString:STARTREADINESSASSESSMENT])
	{
		[self.view bringSubviewToFront:self.startReadinessAssessmentView];
	}
	else if ([self.contentId isEqualToString:MYASSESSMENTVIEW])
	{
		[self.view bringSubviewToFront:self.myAssessmentView];
	}
	
	[self.view bringSubviewToFront:self.splitView];
    
    //Method to set labels of StartReadinessAssessmentView.
    [self.startReadinessAssessmentView setViewControllers];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appHasGoneInBackground:)
                                                                name:UIApplicationDidEnterBackgroundNotification
                                                                object:nil];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//these button events will replaced when we implement table view inside split view container.
#pragma mark ---- button delegate ----
/***********************************************************************************************************
 * Method Name                            : openStartAssessmentView
 * Description                            : Method to open StartAssessmentView
 * @Param                            : nil
 * @return                            : void
 * Modification Log
 * Date                                Author                                        Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013                            FXBytes                                    Created
 ***********************************************************************************************************/
-(void)openStartAssessmentView
{
    UIView *controllerView = [super currentView]; //get the top sliding view.
    
    self.myAssessmentPDFView.vwPopUp.hidden = YES;
    
    if(![controllerView isMemberOfClass:[StartReadinessAssessmentView class]]){
	[UIView transitionFromView:controllerView toView:self.startReadinessAssessmentView duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve completion:nil];
        
        [self.view bringSubviewToFront:self.splitView];
	}
}

/***********************************************************************************************************
 * Method Name                            : openMyAssessmentView
 * Description                            : Method to open MyAssessmentView
 * @Param                           : nil
 * @return                            : void
 * Modification Log
 * Date                                Author                                        Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013                            FXBytes                                    Created
 ***********************************************************************************************************/
-(void)openMyAssessmentView
{
    UIView *controllerView = [super currentView]; //get the top sliding view.

    if(![controllerView isMemberOfClass:[MyAssessmentView class]]){
	[UIView transitionFromView:controllerView toView:self.myAssessmentView duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve completion:nil];
        [self.myAssessmentView setViewControllers];
        [self.view bringSubviewToFront:self.splitView];
    }
}

/***********************************************************************************************************
 * Method Name                            : openCurrentEnvironmentView
 * Description                            : Method to open CurrentEnvironmentViewController
 * @Param                               : nil
 * @return                            : void
 * Modification Log
 * Date                                Author                                        Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013                            FXBytes                                    Created
 ***********************************************************************************************************/
-(void)openCurrentEnvironmentView
{
    UIView *controllerView = [super currentView]; //get the top sliding view.
    
    if(![controllerView isMemberOfClass:[CurrentEnvironmentViewController class]]){
    
	[UIView transitionFromView:controllerView toView:self.currentEnvironmentView duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve completion:nil];
        
        [self.currentEnvironmentView setViewControllers];
        [self.view bringSubviewToFront:self.splitView];
    }
}

/***********************************************************************************************************
 * Method Name                            : openSummaryView
 * Description                            : Method to open SummaryView
 * @Param                               : nil
 * @return                            : void
 * Modification Log
 * Date                                Author                                        Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013                            FXBytes                                    Created
 ***********************************************************************************************************/
-(void)openSummaryView
{
    UIView *controllerView = [super currentView]; //get the top sliding view.
    if(![controllerView isMemberOfClass:[SummaryView class]]){
	[UIView transitionFromView:controllerView toView:self.summaryView duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve completion:nil];
        
        [self.summaryView setViewControllers];
        [self.view bringSubviewToFront:self.splitView];
    }
}

/***********************************************************************************************************
 * Method Name                            : openRecommendationView
 * Description                            : Method to open RecommendationView
 * @Param                               : nil
 * @return                            : void
 * Modification Log
 * Date                                Author                                        Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013                            FXBytes                                    Created
 ***********************************************************************************************************/
-(void)openRecommendationView
{
    UIView *controllerView = [super currentView]; //get the top sliding view.
    if(![controllerView isMemberOfClass:[RecommendationView class]]){
        [UIView transitionFromView:controllerView toView:self.recommendationView duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve completion:nil];
        
        [self.recommendationView setViewControllers];
        [self.view bringSubviewToFront:self.splitView];
    }
}

/***********************************************************************************************************
 * Method Name                            : openUpgradeProceduresView
 * Description                            : Method to open UpgradeProceduresView
 * @Param                               : nil
 * @return                            : void
 * Modification Log
 * Date                                Author                                        Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013                            FXBytes                                    Created
 ***********************************************************************************************************/
-(void)openUpgradeProceduresView
{
    UIView *controllerView = [super currentView]; //get the top sliding view.
    if(![controllerView isMemberOfClass:[UpgradeProceduresView class]]){
        [UIView transitionFromView:controllerView toView:self.upgradeProceduresView duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve completion:nil];
        
        [self.upgradeProceduresView setViewControllers];
        [self.view bringSubviewToFront:self.splitView];
    }
}

/***********************************************************************************************************
 * Method Name                            : openPDFView:(NSURL *)strPdfName
 * Description                            : Method to open MyAssessmentPDFView
 * @Param                               : nil
 * @return                            : void
 * Modification Log
 * Date                                Author                                        Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013                            FXBytes                                    Created
 ***********************************************************************************************************/
- (void)openPDFView:(NSURL *)strPdfName
{
    UIView *controllerView = [super currentView]; //get the top sliding view.
    
    if(![controllerView isMemberOfClass:[MyAssessmentPDFView class]]){
    
	[UIView transitionFromView:controllerView toView:self.myAssessmentPDFView duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve completion:nil];
    }
     [self.myAssessmentPDFView setViewControllers:strPdfName];
	[self.view bringSubviewToFront:self.splitView];
}


#pragma mark ---- Overridden Methods ----
/***********************************************************************************************************
 * Method Name                            : - (void)categoryRowTapped:(NSString *)strRow withSection:(NSString *)strSection
 * Description                            : class method to check which category row is tapped.
 * @Param                            strRow    : string parameter is passed to detect for which section category is tapped
 strSection: string to know the section number
 * @return                            : void
 * Modification Log
 * Date                                Author                                        Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013                            FXBytes                                    Created
 ***********************************************************************************************************/

- (void)categoryRowTapped:(NSString *)strRow withSection:(NSString *)strSection title:(NSString *)strTitle {
    
    if ([strSection isEqualToString:STARTREADINESSASSESSMENT]) {
        int rownum = [strRow intValue] + 1;

        if(rownum == kCurrentEnvironment)
        {
            [self openCurrentEnvironmentView];
        }
        else if(rownum == kSummary)
        {
            [self openSummaryView];
        }
        else if(rownum == kRecommendation)
        {
            [self openRecommendationView];
        }
        else if(rownum == kUpgradeProcedure)
        {
            [self openUpgradeProceduresView];
        }
    }
    else if ([strSection isEqualToString:MYASSESSMENTVIEW]) {
        NSURL *fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:strTitle ofType:@"pdf"]];
        [self openPDFView:fileURL];
    }
}

/***********************************************************************************************************
 * Method Name                            : - (void)sectionRowTapped:(NSString *)strRow withSection:(NSString *)strSection
 * Description                            : class method to check which section row is tapped.
 * @Param                            strRow    : string parameter is passed to detect which row is tapped
 strSection: string to know the section number
 * @return                            : void
 * Modification Log
 * Date                                Author                                        Description
 * ---------------------------------------------------------------------------------------------------------
 * 11/4/2013                            FXBytes                                    Created
 ***********************************************************************************************************/

- (void)sectionRowTapped:(NSString *)strRow withSection:(NSString *)strSection {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *strValue = [defaults objectForKey:strRow];
    NSArray *arrSeparated = [strValue componentsSeparatedByString:@"_"];
    
    self.strKey = strRow;
    
    if ([strSection isEqualToString:STARTREADINESSASSESSMENT]) {
        
        if ([arrSeparated count] != 0 && [strSection isEqualToString:@"1"]) {
            
            NSInteger rowID = [[arrSeparated objectAtIndex:0] intValue];
            NSInteger rowID1 = [[arrSeparated objectAtIndex:1] intValue];
            
            [self.splitView reloadTableAgain:rowID1-1];
            
            int rownum = rowID + 1;
            
            if(rownum == kCurrentEnvironment)
            {
                [self openCurrentEnvironmentView];
            }
            else if(rownum == kSummary)
            {
                [self openSummaryView];
            }
            else if(rownum == kRecommendation)
            {
                [self openRecommendationView];
            }
            else if(rownum == kUpgradeProcedure)
            {
                [self openUpgradeProceduresView];
            }
        }
        else{
            [self openCurrentEnvironmentView];
        }
    }
    else if ([strSection isEqualToString:MYASSESSMENTVIEW]){
        [self openMyAssessmentView];
        [defaults setValue:nil forKey:[NSString stringWithFormat:@"%@",self.strKey]];
        [defaults synchronize];
//        if ([arrSeparated count] != 0 && [strSection isEqualToString:@"2"]) {
//            NSString *strTitle = [arrSeparated objectAtIndex:2];
//            NSURL *fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:strTitle ofType:@"pdf"]];
//            [self openPDFView:fileURL];
//        }
//        
//        else
//        {
//            
//        }
    }
    
    

}

/***********************************************************************************************************
 * Method Name							: canShowView()
 * Description							: class method to check whether viewcontroller will appear or not.
 * @Param								: nil
 * @return							: Bool
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 4/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(BOOL)canShowView
{
	[super canShowView];
	return TRUE;
}

#pragma mark----- touches delegate -----

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint location = [touch locationInView:self.splitView];
	CGPoint locationInMainView = [touch locationInView:self.view];
	
	//this is the frame where we want to get touch.
	CGRect collaspeFrame = CGRectMake(SplitViewWidth, 0, 43, [UIScreen mainScreen].bounds.size.width);
	
	//to check whether user click on right portion of slider or elsewhere.
	if (CGRectContainsPoint(collaspeFrame, location)) {
		beginPoint = locationInMainView;	//save initial touch when user touch slide bar.
		tempSplitView = self.splitView;	//increase one local referance to perform functionality on the sliding view.
        isTouchesEnd = NO; // to check whether colapse/expamd method is called during touches movd or after touches end.
	}
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint location = [touch locationInView:self.view];
	
	if (location.x > SplitViewBoundary) {
		return;
	}
	
	if(tempSplitView != nil)
	{
		//when user collaspe the slider
		if (beginPoint.x >= location.x) {
			[self collaspeSlider:location];
		}
		else { //when user expand the slider.
			[self expandSlider:location];
		}
		
		//move the split view.
		tempSplitView.frame = CGRectMake(location.x - SplitViewWidth, 0, self.splitView.frame.size.width, self.splitView.frame.size.height);
	}
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if (tempSplitView != nil) {
		UITouch *touch = [[event allTouches] anyObject];
		CGPoint location = [touch locationInView:self.view];
		CGRect finalFrame = tempSplitView.frame;
		//float duration = 0.0f;
		
		endPoint = location; //get that point where user left his touch.
		isTouchesEnd = YES;
        
		if (endPoint.x > SplitViewEndMinPoint && endPoint.x < SplitViewEndMaxPoint) { //to check touch end within a boundary or not.
			
			if (beginPoint.x >= endPoint.x) {	//check whether collaspe arises.
				
				if (beginPoint.x - endPoint.x > SplitViewMinimumPullValue) {
					
					//duration = location.x / SpliteViewAnimationDurationSpeed;
					finalFrame = CGRectMake(-SplitViewWidth, 0, self.splitView.frame.size.width, self.splitView.frame.size.height);

                    [self collaspeSlider:location];
				}
				else {
					
					//duration = 0.2f;
					finalFrame = CGRectMake(0, 0, self.splitView.frame.size.width, self.splitView.frame.size.height);

                    [self expandSlider:location];
				}
			}
			else if(beginPoint.x <= endPoint.x){	//check whether expand arises.
				
				if (endPoint.x - beginPoint.x >= SplitViewMinimumPullValue) {
					
					//duration = 0.2f;
					finalFrame = CGRectMake(0, 0, self.splitView.frame.size.width, self.splitView.frame.size.height);

                    [self expandSlider:location];
				}
				else {
					
					//duration = location.x / SpliteViewAnimationDurationSpeed;
					finalFrame = CGRectMake(-SplitViewWidth, 0, self.splitView.frame.size.width, self.splitView.frame.size.height);
                    
                    [self collaspeSlider:location];
				}
			}
		}
		else {	//when touches are outside the boundary. 
			if (endPoint.x < SplitViewEndMinPoint) {
				
				//duration = location.x / SpliteViewAnimationDurationSpeed;
				finalFrame = CGRectMake(-SplitViewWidth, 0, self.splitView.frame.size.width, self.splitView.frame.size.height);
                
                [self collaspeSlider:location];
			}
			else if (endPoint.x > SplitViewEndMaxPoint)
            {
                    //duration = 0.2f;
                    finalFrame = CGRectMake(0, 0, self.splitView.frame.size.width, self.splitView.frame.size.height);
                
                    [self expandSlider:location];
            }
		}
		
		[self setSliderView:finalFrame];
	}
	
	//reset touches and split view.
	beginPoint = CGPointZero;
	tempSplitView = nil;
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	//[self touchesEnded:touches withEvent:event];
}

#pragma mark ---- Collaspe and Expand Methods ----
/***********************************************************************************************************
 * Method Name							: collaspeSlider(CGPoint)
 * Description							: class method when collaspe condition arises on slider.
 * @Param								: location as a CGPoint, the value of touch point
 * @return							: void
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 8/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)collaspeSlider:(CGPoint)location
{
	//change the frames of all the sliding components
	UIView *controllerView = (UIView *)[[self.view subviews] objectAtIndex:([self.view subviews].count-2)]; //get the top sliding view.
	
	float diff = [UIScreen mainScreen].bounds.size.height - location.x;
	controllerView.frame = CGRectMake(location.x, controllerView.frame.origin.y, diff, controllerView.frame.size.height);
	
    //if condition runs only when call is from touches move method.
    if(isTouchesEnd == NO)
    {
        if([controllerView isMemberOfClass:[StartReadinessAssessmentView class]])
        {
            for (UIView *innerControllerView in [controllerView subviews])
            {
                if ([innerControllerView isKindOfClass:[UIImageView class]])
                {
                    if(innerControllerView.tag != 11)
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                    else
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                    }
                }
                
            }
        }
        
        else if([controllerView isMemberOfClass:[CurrentEnvironmentViewController class]])
        {
            for (UIView *innerControllerView in [controllerView subviews])
            {
                if ([innerControllerView isKindOfClass:[UIImageView class]])
                {
                    if(innerControllerView.tag == 12)
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                        
                    else if(innerControllerView.tag == 13)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                    }
                }
            }
        }
        
        else if([controllerView isMemberOfClass:[SummaryView class]])
        {
            for (UIView *innerControllerView in [controllerView subviews])
            {
                if ([innerControllerView isKindOfClass:[UIImageView class]])
                {
                    if(innerControllerView.tag == 21)
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                    
                    else if(innerControllerView.tag == 22)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                    }
                }
            }
        }
        
        else if([controllerView isMemberOfClass:[RecommendationView class]])
        {
            for (UIView *innerControllerView in [controllerView subviews])
            {
                if ([innerControllerView isKindOfClass:[UIImageView class]])
                {
                    if(innerControllerView.tag == 41)
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                    
                    else if(innerControllerView.tag == 42)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                    }
                }
            }
        }
        
        else if([controllerView isMemberOfClass:[UpgradeProceduresView class]])
        {
            for (UIView *innerControllerView in [controllerView subviews])
            {
                if ([innerControllerView isKindOfClass:[UIImageView class]])
                {
                    if(innerControllerView.tag == 51)
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                    
                    else if(innerControllerView.tag == 52)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                    }
                }
            }
        }

        
        else if([controllerView isMemberOfClass:[MyAssessmentView class]])
        {
            for (UIView *innerControllerView in [controllerView subviews])
            {
                if ([innerControllerView isKindOfClass:[UIImageView class]])
                {
                    if(innerControllerView.tag == 31)
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                    
                    else if(innerControllerView.tag == 32)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                    }
                }
            }
        }
        
        else if([controllerView isMemberOfClass:[MyAssessmentPDFView class]])
        {
            for (UIView *innerControllerView in [controllerView subviews])
            {
                if ([innerControllerView isKindOfClass:[UIImageView class]])
                {
                    if(innerControllerView.tag == 71)
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                    
                    else if(innerControllerView.tag == 72)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                    }
                }
            }
        }



    }//else condition runs only when call is from touches end method.
    else
    {
        if([controllerView isMemberOfClass:[StartReadinessAssessmentView class]])
        {
            [self.startReadinessAssessmentView expandStartReadinessView];
        }
        else if([controllerView isMemberOfClass:[CurrentEnvironmentViewController class]])
        {
            [self.currentEnvironmentView expandCurrentEnvironmentView];
        }
        else if([controllerView isMemberOfClass:[SummaryView class]])
        {
            [self.summaryView expandSummaryView];
        }
        else if([controllerView isMemberOfClass:[RecommendationView class]])
        {
            [self.recommendationView expandRecommendationView];
        }
        else if([controllerView isMemberOfClass:[UpgradeProceduresView class]])
        {
            [self.upgradeProceduresView expandUpgradeProceduresView];
        }
        else if([controllerView isMemberOfClass:[MyAssessmentView class]])
        {
            [self.myAssessmentView expandMyAssessmentView];
        }
        else if([controllerView isMemberOfClass:[MyAssessmentPDFView class]])
        {
            [self.myAssessmentPDFView expandMyAssessmentPDFViewView];
        }
        isTouchesEnd = NO;
    }
}
/***********************************************************************************************************
 * Method Name							: expandSlider(CGPoint)
 * Description							: class method when expand condition arises on slider.
 * @Param								: location as a CGPoint, the value of touch point
 * @return							: void
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 8/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)expandSlider:(CGPoint)location
{
	//change the frames of all the sliding components
	UIView *controllerView = (UIView *)[[self.view subviews] objectAtIndex:([self.view subviews].count-2)];
	
	float diff = location.x - controllerView.frame.origin.x;
	controllerView.frame = CGRectMake(location.x, controllerView.frame.origin.y, controllerView.frame.size.width - diff, controllerView.frame.size.height);
	
    //if condition runs only when call is from touches move method.
    if(isTouchesEnd == NO)
    {
        if([controllerView isMemberOfClass:[StartReadinessAssessmentView class]])
        {
            for (UIView *innerControllerView in [controllerView subviews]) {
                if ([innerControllerView isKindOfClass:[UIImageView class]])
                {
                    if(innerControllerView.tag != 11)
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                    else
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                    }
                }
            }
        }
        
        else if([controllerView isMemberOfClass:[CurrentEnvironmentViewController class]])
        {
            for (UIView *innerControllerView in [controllerView subviews])
            {
                if ([innerControllerView isKindOfClass:[UIImageView class]])
                {
                    if(innerControllerView.tag == 12)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                    }
                    else if(innerControllerView.tag == 13)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                       
                    }
                }
            }
        }
        
        else if([controllerView isMemberOfClass:[SummaryView class]])
        {
            for (UIView *innerControllerView in [controllerView subviews])
            {
                if ([innerControllerView isKindOfClass:[UIImageView class]])
                {
                    if(innerControllerView.tag == 21)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                    }
                    else if(innerControllerView.tag == 22)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                    }
                }
            }
        }
        
        else if([controllerView isMemberOfClass:[RecommendationView class]])
        {
            for (UIView *innerControllerView in [controllerView subviews])
            {
                if ([innerControllerView isKindOfClass:[UIImageView class]])
                {
                    if(innerControllerView.tag == 41)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                    }
                    else if(innerControllerView.tag == 42)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                    }
                }
            }
        }

        else if([controllerView isMemberOfClass:[UpgradeProceduresView class]])
        {
            for (UIView *innerControllerView in [controllerView subviews])
            {
                if ([innerControllerView isKindOfClass:[UIImageView class]])
                {
                    if(innerControllerView.tag == 51)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                    }
                    else if(innerControllerView.tag == 52)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                    }
                }
            }
        }

        
        else if([controllerView isMemberOfClass:[MyAssessmentView class]])
        {
            for (UIView *innerControllerView in [controllerView subviews])
            {
                if ([innerControllerView isKindOfClass:[UIImageView class]])
                {
                    if(innerControllerView.tag == 31)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                    }
                    else if(innerControllerView.tag == 32)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, 1024, controllerView.frame.size.height);
                    }
                }
                
            }
        }
        
        else if([controllerView isMemberOfClass:[MyAssessmentPDFView class]])
        {
            for (UIView *innerControllerView in [controllerView subviews])
            {
                if ([innerControllerView isKindOfClass:[UIImageView class]])
                {
                    if(innerControllerView.tag == 71)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                    }
                    else if(innerControllerView.tag == 72)
                    {
                        ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, 1024, controllerView.frame.size.height);
                    }
                }
                
            }
        }


    }
    else
    {
        if([controllerView isMemberOfClass:[StartReadinessAssessmentView class]])
        {
            [self.startReadinessAssessmentView collapseStartReadinessView];
        }
        
        else if([controllerView isMemberOfClass:[CurrentEnvironmentViewController class]])
        {
            [self.currentEnvironmentView collapseCurrentEnvironmentView];
        }
        
        else if([controllerView isMemberOfClass:[SummaryView class]])
        {
            [self.summaryView collapseSummaryView];
        }
        
        else if([controllerView isMemberOfClass:[RecommendationView class]])
        {
            [self.recommendationView collapseRecommendationView];
        }
        else if([controllerView isMemberOfClass:[UpgradeProceduresView class]])
        {
            [self.upgradeProceduresView collapseUpgradeProceduresView];
        }
        else if([controllerView isMemberOfClass:[MyAssessmentView class]])
        {
            [self.myAssessmentView collapseMyAssessmentView];
        }
        else if([controllerView isMemberOfClass:[MyAssessmentPDFView class]])
        {
            [self.myAssessmentPDFView collapseMyAssessmentPDFViewView];
        }
    } // else end
}

/***********************************************************************************************************
 * Method Name							: setSliderView(CGRect,float)
 * Description							: class method slides the split view when get end touches.
 * @Param								: frame as a CGRect, frame where we set the split view after get end touch event.
									: duration as a float to perform animation duration on view.
 * @return							: void
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 8/4/2013							FXBytes									Created
 ***********************************************************************************************************/

-(void)setSliderView:(CGRect)frame
{
    self.splitView.frame = frame;
	
	UIView *controllerView = (UIView *)[[self.view subviews] objectAtIndex:([self.view subviews].count-2)];
	if (frame.origin.x == 0) {
		controllerView.frame = CGRectMake(SplitViewWidth, controllerView.frame.origin.y, 684, controllerView.frame.size.height);
	}
	else {
		controllerView.frame = CGRectMake(0, controllerView.frame.origin.y, [UIScreen mainScreen].bounds.size.height, controllerView.frame.size.height);
	}
	
	if([controllerView isMemberOfClass:[StartReadinessAssessmentView class]])
    {
        for (UIView *innerControllerView in [controllerView subviews])
        {
            if ([innerControllerView isKindOfClass:[UIImageView class]])
            {
                if(innerControllerView.tag != 11)
                    ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                else
                {
                    ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                }
            }
            
        }
    }
    
    else if([controllerView isMemberOfClass:[CurrentEnvironmentViewController class]])
    {
        for (UIView *innerControllerView in [controllerView subviews])
        {
            if ([innerControllerView isKindOfClass:[UIImageView class]])
            {
                if(innerControllerView.tag == 12)
                {
                    ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                }
                else if(innerControllerView.tag == 13)
                {

                    ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                }
            }
            
        }
        
    }
    
    else if([controllerView isMemberOfClass:[SummaryView class]])
    {
        for (UIView *innerControllerView in [controllerView subviews])
        {
            if ([innerControllerView isKindOfClass:[UIImageView class]])
            {
                if(innerControllerView.tag == 21)
                {
                    ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                }
                else if(innerControllerView.tag == 22)
                {
                    ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                }
            }
            
        }
        
    }
    
    else if([controllerView isMemberOfClass:[RecommendationView class]])
    {
        for (UIView *innerControllerView in [controllerView subviews])
        {
            if ([innerControllerView isKindOfClass:[UIImageView class]])
            {
                if(innerControllerView.tag == 41)
                {
                    ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                }
                else if(innerControllerView.tag == 42)
                {
                    ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                }
            }
            
        }
        
    }
    
    else if([controllerView isMemberOfClass:[UpgradeProceduresView class]])
    {
        for (UIView *innerControllerView in [controllerView subviews])
        {
            if ([innerControllerView isKindOfClass:[UIImageView class]])
            {
                if(innerControllerView.tag == 51)
                {
                    ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                }
                else if(innerControllerView.tag == 52)
                {
                    ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                }
            }
            
        }
        
    }

    else if([controllerView isMemberOfClass:[MyAssessmentView class]])
    {
        for (UIView *innerControllerView in [controllerView subviews])
        {
            if ([innerControllerView isKindOfClass:[UIImageView class]])
            {
                if(innerControllerView.tag == 31)
                {
                    ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                }
                else if(innerControllerView.tag == 32)
                {
                    ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                }
            }
        }
    }
    
    else if([controllerView isMemberOfClass:[MyAssessmentPDFView class]])
    {
        for (UIView *innerControllerView in [controllerView subviews])
        {
            if ([innerControllerView isKindOfClass:[UIImageView class]])
            {
                if(innerControllerView.tag == 71)
                {
                    ((UIImageView *)innerControllerView).frame = CGRectMake(0, 0, controllerView.frame.size.width, 55);
                }
                else if(innerControllerView.tag == 72)
                {
                    ((UIImageView *)innerControllerView).frame = CGRectMake(0, 55, controllerView.frame.size.width, controllerView.frame.size.height);
                }
            }
        }
    }

    
}

#pragma mark -------Action Methods-------
/***********************************************************************************************************
 * Method Name							: openHomeView:(id)sender
 * Description							: Method to open Homeview.
 * @Param								: (id)sender.
 * @return							: IBAction
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
- (IBAction)openHomeView:(id)sender {
	
	ViewManager *manager = [((AppDelegate*)[UIApplication sharedApplication].delegate) manager];
	if([manager canSwitchToViewWithId:HOMEVIEWCONTROLLER])
	{
		[manager switchToViewWithId:HOMEVIEWCONTROLLER];
	}
}

/***********************************************************************************************************
 * Method Name							: backBtnTapEvent
 * Description							: Method to open Homeview.
 * @Param								: (id)sender.
 * @return							: IBAction
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)backBtnTapEvent
{
    ViewManager *manager = [((AppDelegate*)[UIApplication sharedApplication].delegate) manager];
	if([manager canSwitchToViewWithId:HOMEVIEWCONTROLLER])
	{
		[manager switchToViewWithId:HOMEVIEWCONTROLLER];
	}
      NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
      [defaults setValue:nil forKey:[NSString stringWithFormat:@"%@",self.strKey]];
      [defaults synchronize];
}

/***********************************************************************************************************
 * Method Name							: saveBtnTapped
 * Description							: Method will call when save button on SaveView is clicked and to reopen lastly open view.
 * @Param								: void.
 * @return                              : void
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)saveBtnTapped
{
    self.saveView.hidden = NO;
    self.summaryView.vwPopUp.hidden = YES;
    self.currentEnvironmentView.vwPopUp.hidden = YES;
    [self.view bringSubviewToFront:self.saveView];
    [self.saveView setViewControllers];
}

/***********************************************************************************************************
 * Method Name							: cancelBtnTapped
 * Description							: Method will call when cancel button on SaveView is clicked and to reopen lastly open view.
 * @Param								: void.
 * @return                              : void
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)cancelBtnTapped
{
    [self.saveView.txtFieldReportName resignFirstResponder];
    self.saveView.hidden = YES;
    [self.view sendSubviewToBack:self.saveView];
    [self.view bringSubviewToFront:self.splitView];
}

/***********************************************************************************************************
 * Method Name							: emailBtnTapped
 * Description							: Method to open Email Pop Up.
 * @Param								: nil.
 * @return							: void
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
-(void)emailBtnTapped {
    
    self.myAssessmentPDFView.vwPopUp.hidden = YES;
    self.summaryView.vwPopUp.hidden = YES;
    self.recommendationView.vwPopUp.hidden = YES;
    self.currentEnvironmentView.vwPopUp.hidden = YES;
    
    if ([MFMailComposeViewController canSendMail])
    {
        
        MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
        mailComposer.mailComposeDelegate = self;
        
        Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
        
        if (mailClass != nil) {
            // We must always check whether the current device is configured for sending emails
            if ([mailClass canSendMail]) {
                [mailComposer setToRecipients:nil];
                [mailComposer setSubject:nil];
                                
                [self presentModalViewController:mailComposer animated:YES];
            } else {
                
            }
        } else	{
            
        }
    }
}

#pragma mark MFMailComposeViewControllerDelegate methods
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	if (result == MFMailComposeResultSent) {
	} else {
    }// if
	[self dismissModalViewControllerAnimated:YES];
}// mailComposeController


#pragma mark - Function is called when app goes to background
/***********************************************************************************************************
 * Method Name							: appHasGoneInBackground:(id)sender
 * Description							: Method will set User Defails keys to nil while application close.
 * @Param								: nil.
 * @return							: void
 * Modification Log
 * Date 								Author 										Description
 * ---------------------------------------------------------------------------------------------------------
 * 9/4/2013							FXBytes									Created
 ***********************************************************************************************************/
- (void)appHasGoneInBackground:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:nil forKey:[NSString stringWithFormat:@"%@",self.strKey]];
    [defaults synchronize];
}

@end
