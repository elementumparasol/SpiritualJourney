//
//  main.m
//  对象实例变量和属性
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESEmployee.h"
#import "ESAssets.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 创建一个数组，用来包含多个ESEmployee对象
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            // 创建ESEmployee实例
            ESEmployee *mikey = [[ESEmployee alloc] init];
            
            // 为实例变量赋值
            mikey.weightInKilos = 90 + i;
            mikey.heightInMeters = 1.8 - i/10.0;
            mikey.employeeID = i;
            
            // 将创建的实例加入到数组中
            [employees addObject:mikey];
        }
        
        // 创建10个ESAssets对象
        for (int i = 0; i < 10; i++) {
            
            // 创建ESAssets对象
            ESAssets *asset = [[ESAssets alloc] init];
            
            // 为ESAssets对象设置合适的标签
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            asset.label = currentLabel;
            asset.resaleValue = 350 + i * 17;
            
            // 生成0至9之间的随机数(包含0和9)
            NSUInteger randomIndex = rand() % [employees count];
            
            // 取出相应的ESEmployee对象
            ESEmployee *randomEmployee = [employees objectAtIndex:randomIndex];
            
            // 将ESAssets对象赋值给SESEmployee对象
            [randomEmployee addAsset:asset];
        }
        
        NSLog(@"employees: %@", employees);
        
        NSLog(@"---------------------");
        
        [employees removeObjectAtIndex:5];
        
        NSLog(@"---------------------");
        
        employees = nil;
    }
    return 0;
}
