//
//  ESPerson.m
//  对象实例变量和属性
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import "ESPerson.h"

@implementation ESPerson

- (float)bodyMassIndex {
    
    int w = self.weightInKilos;
    float h = self.heightInMeters;
    
    return w / (h * h);
}

@end
