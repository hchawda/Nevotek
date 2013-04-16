//
//  NVSoftwareAssesstment.h
//  Milestone-RB02
//
//  Created by Sergey Kuryanov on 10.04.13.
//  Copyright (c) 2013 Sergey Kuryanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVSoftwareAssessment : NSObject
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *recommendation;
@property (nonatomic, strong) NSString *nextStepMessage;
@property (nonatomic, strong) NSString *link;

@end
