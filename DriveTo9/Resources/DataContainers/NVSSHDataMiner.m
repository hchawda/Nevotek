//
//  NVSSHDataMiner.m
//  DataContainerClasses
//
//  Created by Isomac on 4/11/13.
//  Copyright (c) 2013 Isomac. All rights reserved.
//

#import "NVSSHDataMiner.h"

@implementation NVSSHDataMiner

+(NVCUCMCluster *) getCluster{
    
    NVCUCMCluster *toReturn = [NVCUCMCluster new];
    toReturn.version = @"7.1.5";
    toReturn.host =@"cucmSRV7";
    toReturn.name =@"Mock Cluster";
    toReturn.vmCluster = false;
    toReturn.unhealthy = false;
    toReturn.unrecognizedVersion = false;
    toReturn.blacklistedDeviceContainer = true;
    
    NSMutableArray *servers = [NSMutableArray arrayWithCapacity:8];
    //Servers
    for(int i=0;i<8;i++){
        NVServer *server = [NVServer new];
        server.hardwareModel = @"7845I3";
        server.cucmVersion = @"7.1.5";
        server.unityConnectionServer = false;
        server.unityServer = false;
        server.vmHardware = false;
        server.publisher = false;
        server.compatibleWith6_1_5 = true;
        server.compatibleWith8_0_3 = true;
        server.compatibleWith8_5_1 = true;
        server.compatibleWith9_1 = true;
        server.compatibleWithCUCMBridge8_0 = true;
        server.compatibleWithCUCMBridge8_5 = true;
        server.compatibleWithCUCMBridge9_1 = true;
        server.unrecognizedCUCMServer = false;
        server.diskSpaceAvailable = 200;
        server.diskSpaceTotal = 400;
        if(i == 0){
            server.publisher = true;
        }
        if(i==7){
            server.unityConnectionServer = true;
            server.unityModel = @"Unity Model";
            server.unityType = @"Unity Type";
            server.unityVersion = @"Unity Version";
        }
        [servers addObject:server];
    }
    toReturn.servers = servers;
    
    NSMutableArray *gateways = [NSMutableArray arrayWithCapacity:10];
    //Gateways
    for(int i=0;i<8;i++){
        NVGateway *gateway = [NVGateway new];
        gateway.type = @"H.323";
        gateway.name = @"H.323 Gateway";
        gateway.gatewayDescription = [NSString stringWithFormat:@"Gateway %d",i];
        [gateways addObject:gateway];
    }
    toReturn.gateways = gateways;
    
    NSMutableArray *endPoints = [NSMutableArray arrayWithCapacity:10];
    //Endpoints
    NVEndpoint *endpoint1 = [NVEndpoint new];
    endpoint1.model = @"Cisco 7911";
    endpoint1.quantity = 50;
    endpoint1.blacklisted = false;
    [endPoints addObject:endpoint1];
    
    NVEndpoint *endpoint2 = [NVEndpoint new];
    endpoint2.model = @"Cisco 7920";
    endpoint2.quantity = 50;
    endpoint2.blacklisted = false;
    [endPoints addObject:endpoint2];
    
    NVEndpoint *endpoint3 = [NVEndpoint new];
    endpoint2.model = @"Cisco 7905";
    endpoint2.quantity = 10;
    endpoint2.blacklisted = true;
    [endPoints addObject:endpoint3];
    
    toReturn.endpoints = endPoints;
    
    
    NVReport *report = [NVReport new];
    report.clusterName = toReturn.name;
    report.clusterVersion = toReturn.version;
    report.directUpgrade = @"EDCS-1240861";
    report.haUpgrade = nil;
    report.bridgeUpgrade = nil;
    
    NVSummary *summary = [NVSummary new];
    summary.softwareIcon = @"YELLOW";
    summary.softwareMassage = @"This release supports one or more upgrade options.";
    summary.hardwareIcon = @"GREEN";
    summary.hardwareMessage = @"All servers are compatible with Unified Communication Manager Release 9.1.";
    summary.endpointsIcon = @"YELLOW";
    summary.endpointsMessage = @"One or more endpoints are incompatible with Unified Communications Manager Release 9.1.";
    
    NVSoftwareAssessment *software = [NVSoftwareAssessment new];
    software.icon = @"YELLOW";
    software.recommendation = @"Upgrade to Unified Communication Manager Release 9.1.";
    software.nextStepMessage = @"Go to Upgrade Procedures for details";
    software.link = @"software link";
    
    NSMutableArray *serverAssessments = [NSMutableArray arrayWithCapacity:7];
    
    for (NVServer *server in toReturn.servers) {
        if (server.unityConnectionServer || server.unityServer) {
            //nothing yet
        } else {
            NVServerAssessment *serverAssessment = [NVServerAssessment new];
            serverAssessment.type = server.publisher ? @"Publisher":@"Subscriber";
            serverAssessment.model = server.hardwareModel;
            serverAssessment.icon = @"GREEN";
            serverAssessment.assessment = @"This server is compatible with Unified Communication Manager Release 9.1. ";
            serverAssessment.nextStepMessage = @"Go to Upgrade Procedures for details";
            [serverAssessments addObject:serverAssessment];
        }
    }
    
    NSMutableArray *endPointAssessments = [NSMutableArray arrayWithCapacity:3];
    
    for (NVEndpoint *endpoint in toReturn.endpoints) {
        NVEndpointAssessment *endpointAssessment = [NVEndpointAssessment new];
        endpointAssessment.blacklisted = endpoint.blacklisted;
        endpointAssessment.model = endpoint.model;
        endpointAssessment.count = endpoint.quantity;
        if (endpoint.blacklisted) {
            endpointAssessment.icon = @"YELLOW";
            endpointAssessment.link = @"This endpoint is not compatible with Unified Communications Release 9.1";
        } else {
            endpointAssessment.icon = @"GREEN";
            endpointAssessment.link = @"This endpoint is compatible with Unified Communications Release 9.1";
        }
        [endPointAssessments addObject:endpointAssessment];
    }
    
    NVGeneralAssessment *general = [NVGeneralAssessment new];
    general.icon = @"INFO";
    general.message  = @"General assessment message.";
    
    report.softwareAssessment = software;
    report.serversAssessments = serverAssessments;
    report.endpointsAssessments = endPointAssessments;
    report.generalAssessment = general;
    report.summary = summary;
    
    toReturn.report = report;
    return toReturn;
}



@end
