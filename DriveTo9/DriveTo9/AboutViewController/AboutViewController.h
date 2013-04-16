//
//  AboutViewController.h
//  DriveTo9
//
//  Created by Vipin Dhangar on 4/10/13.
//  Copyright (c) 2013 FXBytes. All rights reserved.
//

#import "BaseViewController.h"

@interface AboutViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate> {
  NSArray *arrAbout;
  NSString *strFontName;
}
@property (strong, nonatomic) IBOutlet UINavigationBar *topNavigationBar;
@property (strong, nonatomic) IBOutlet UILabel *lblCucmUpgarde;
@property (strong, nonatomic) IBOutlet UILabel *lblAllRights;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *arrAbout;
@property (nonatomic, strong) NSString *strFontName;

@end
