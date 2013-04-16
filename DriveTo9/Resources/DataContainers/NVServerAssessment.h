//
//  NVServerAssessment.h
//  Milestone-RB02
//
//  Created by Sergey Kuryanov on 10.04.13.
//  Copyright (c) 2013 Sergey Kuryanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVServerAssessment : NSObject
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *model;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *assessment;
@property (nonatomic, strong) NSString *nextStepMessage;

@end
