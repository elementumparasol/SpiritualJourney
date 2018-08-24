//
//  ESPerson.m
//  类扩展
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import "ESPerson.h"

@implementation ESPerson

- (float)bodyMassIndex {
    
    float h = self.heightInMeters;
    int w = self.weightInKilos;
    return w / (h * h);
}

@end
