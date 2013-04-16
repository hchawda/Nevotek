//
//  NVSSHDataMiner.h
//  DataContainerClasses
//
//  Created by Isomac on 4/11/13.
//  Copyright (c) 2013 Isomac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NVCUCMCluster.h"
#import "NVServer.h"
#import "NVEndpoint.h"
#import "NVGateway.h"
#import "NVReport.h"
#import "NVSummary.h"
#import "NVSoftwareAssessment.h"
#import "NVServerAssessment.h"
#import "NVEndpointAssessment.h"
#import "NVGeneralAssessment.h"

@interface NVSSHDataMiner : NSObject

+(NVCUCMCluster *) getCluster;

@end
