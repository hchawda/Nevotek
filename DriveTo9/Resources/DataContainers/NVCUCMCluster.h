//
//  NVCUCMCluster.h
//  Milestone-RB02
//
//  Created by Sergey Kuryanov on 10.04.13.
//  Copyright (c) 2013 Sergey Kuryanov. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NVReport;

@interface NVCUCMCluster : NSObject
@property (nonatomic, strong) NSString *version;
@property (nonatomic, strong) NSString *host;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *servers;
@property (nonatomic, strong) NSArray *endpoints;
@property (nonatomic, strong) NSArray *gateways;

@property (nonatomic, getter = isVMCluster) BOOL vmCluster;
@property (nonatomic, getter = isUnhealthy) BOOL unhealthy;
@property (nonatomic, getter = isUnrecognizedVersion) BOOL unrecognizedVersion;
@property (nonatomic, getter = isBlacklistedDeviceContainer) BOOL blacklistedDeviceContainer;

@property (nonatomic) int servers9_1Count;
@property (nonatomic) int servers8_5_1Count;
@property (nonatomic) int servers8_0_3Count;
@property (nonatomic) int servers6_1_5Count;

@property (nonatomic) int serversCUCMBridge9_1Count;
@property (nonatomic) int serversCUCMBridge8_5Count;
@property (nonatomic) int serversCUCMBridge8_0Count;

@property (nonatomic) int serversVMCount;

@property (nonatomic, strong) NVReport *report;
@end
