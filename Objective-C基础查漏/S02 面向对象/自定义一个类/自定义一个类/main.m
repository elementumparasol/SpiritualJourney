//
//  main.m
//  自定义一个类
//
//  Created by Enrica on 2018/8/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 创建ESPerson实例
        ESPerson *mikey = [[ESPerson alloc] init];
        
        // 使用setter方法为实例变量赋值
        [mikey setWeightInKilos:96];
        [mikey setHeightInMeters:1.8];
        
        // 使用getter方法打印实例变量的值
        float height = [mikey heightInMeters];
        int weight = [mikey weightInKilos];
        NSLog(@"mikey的身高为%.2f, 体重为%d", height, weight);
        
        // 使用自定义的计算方法计算出BMI
        float bmi = [mikey bodyMassIndex];
        NSLog(@"mikey的bmi值为: %.2f", bmi);
    }
    return 0;
}
