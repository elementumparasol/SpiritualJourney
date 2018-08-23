//
//  ESEmployee.m
//  继承
//
//  Created by Enrica on 2018/8/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import "ESEmployee.h"

@implementation ESEmployee

- (double)yearOfEmployment {
    
    // 判断是否拥有一个非nil的hireDare
    if (self.hireDate) {
        
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        
        return secs / 31557600;  // 每年的秒数
    } else {
        return 0;
    }
}

- (float)bodyMassIndex {
    
    float bmi = [super bodyMassIndex];
    return bmi * 0.9;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"<Employee %d>", self.employeeID];
}

@end
