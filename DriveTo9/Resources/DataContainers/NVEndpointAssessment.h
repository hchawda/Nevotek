//
//  NVEndpointAssessment.h
//  Milestone-RB02
//
//  Created by Sergey Kuryanov on 10.04.13.
//  Copyright (c) 2013 Sergey Kuryanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVEndpointAssessment : NSObject
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *model;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, getter = isBlacklisted) BOOL blacklisted;
@property (nonatomic) int count;
@end
