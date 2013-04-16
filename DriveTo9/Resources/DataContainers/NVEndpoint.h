//
//  NVEndpoint.h
//  Milestone-RB02
//
//  Created by Sergey Kuryanov on 10.04.13.
//  Copyright (c) 2013 Sergey Kuryanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVEndpoint : NSObject
@property (nonatomic, strong) NSString *model;
@property (nonatomic) int quantity;
@property (nonatomic, getter = isBlacklisted) BOOL blacklisted;
@end
