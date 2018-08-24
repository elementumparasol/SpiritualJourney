//
//  ESPerson.m
//  属性
//
//  Created by Enrica on 2018/8/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import "ESPerson.h"

@implementation ESPerson

// 实现bodyMassIndex方法
- (float)bodyMassIndex {
    float h = [self heightInMeters];
    int w = [self weightInKilos];
    
    return w / (h * h);
}

@end
