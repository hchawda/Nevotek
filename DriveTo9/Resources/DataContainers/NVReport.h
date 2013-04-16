//
//  NVReport.h
//  Milestone-RB02
//
//  Created by Sergey Kuryanov on 10.04.13.
//  Copyright (c) 2013 Sergey Kuryanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NVSummary;
@class NVSoftwareAssessment;
@class NVGeneralAssessment;

@interface NVReport : NSObject
@property (nonatomic, strong) NSString *clusterName;
@property (nonatomic, strong) NSString *clusterVersion;
@property (nonatomic, strong) NSString *directUpgrade;
@property (nonatomic, strong) NSString *haUpgrade;
@property (nonatomic, strong) NSString *bridgeUpgrade;

@property (nonatomic, strong) NVSummary *summary;
@property (nonatomic, strong) NVSoftwareAssessment *softwareAssessment;
@property (nonatomic, strong) NSArray *serversAssessments;
@property (nonatomic, strong) NSArray *endpointsAssessments;
@property (nonatomic, strong) NVGeneralAssessment *generalAssessment;
@end
