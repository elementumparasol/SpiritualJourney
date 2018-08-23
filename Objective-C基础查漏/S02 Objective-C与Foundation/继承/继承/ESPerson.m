//
//  ESPerson.m
//  继承
//
//  Created by Enrica on 2018/8/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import "ESPerson.h"

@implementation ESPerson

/** 计算bmi */
- (float)bodyMassIndex {
    
    float height = self.heightInMeters;
    int weight = self.weightInKilos;
    
    return weight / (height * height);
}

@end
