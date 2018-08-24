//
//  ESEmployee.m
//  对象实例变量和属性
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import "ESEmployee.h"
#import "ESAssets.h"

@implementation ESEmployee

- (void)setAssets:(NSArray *)a {
    _assets = [a mutableCopy];
}

- (NSArray *)assets {
    return [_assets copy];
}

- (void)addAsset:(ESAssets *)a {
    
    // 判断_assets是否为nil
    if (!_assets) {
        
        // 创建数组
        _assets = [[NSMutableArray alloc] init];
    }
    
    [_assets addObject:a];
}

- (unsigned int)valueOfAssets {
    
    unsigned int sum = 0;
    for (ESAssets *a in _assets) {
        sum += [a resaleValue];
    }
    return sum;
}

- (double)yearsOfEmployment {
    
    // 判断是否拥有一个非nil的hireDare
    if (self.hireDate) {
        
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        
        return secs / 31557600;  // 每年的秒数
    } else {
        return 0;
    }
}


- (NSString *)description {
    
    return [NSString stringWithFormat:@"<Employee %u: $%u in assets>", self.employeeID, self.valueOfAssets];
}

- (void)dealloc {
    
    NSLog(@"调用了ESEmployee的dealloc方法....");
}

@end
