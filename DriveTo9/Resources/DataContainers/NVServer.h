//
//  NVServer.h
//  Milestone-RB02
//
//  Created by Sergey Kuryanov on 10.04.13.
//  Copyright (c) 2013 Sergey Kuryanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVServer : NSObject
@property (nonatomic, strong) NSString *hardwareModel;
@property (nonatomic, strong) NSString *cucmVersion;
@property (nonatomic, strong) NSString *lacklis;
@property (nonatomic, strong) NSString *unityVersion;
@property (nonatomic, strong) NSString *unityModel;
@property (nonatomic, strong) NSString *unityType;
@property (nonatomic, getter = isUnityServer) BOOL unityServer;
@property (nonatomic, getter = isUnityConnectionServer) BOOL unityConnectionServer;
@property (nonatomic, getter = isVMHardware) BOOL vmHardware;
@property (nonatomic, getter = isPublisher) BOOL publisher;
@property (nonatomic) int diskSpaceTotal;
@property (nonatomic) int diskSpaceAvailable;

@property (nonatomic, getter = isCompatibleWith9_1) BOOL compatibleWith9_1;
@property (nonatomic, getter = isCompatibleWith8_5_1) BOOL compatibleWith8_5_1;
@property (nonatomic, getter = isCompatibleWith8_0_3) BOOL compatibleWith8_0_3;
@property (nonatomic, getter = isCompatibleWith6_1_5) BOOL compatibleWith6_1_5;

@property (nonatomic, getter = isCompatibleWithCUCMBridge9_1) BOOL compatibleWithCUCMBridge9_1;
@property (nonatomic, getter = isCompatibleWithCUCMBridge8_5) BOOL compatibleWithCUCMBridge8_5;
@property (nonatomic, getter = isCompatibleWithCUCMBridge8_0) BOOL compatibleWithCUCMBridge8_0;

@property (nonatomic, getter = isUnrecognizedCUCMServer) BOOL unrecognizedCUCMServer;

@end
