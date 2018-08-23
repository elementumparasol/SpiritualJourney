//
//  main.m
//  属性
//
//  Created by Enrica on 2018/8/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 创建实例对象
        ESPerson *jim = [[ESPerson alloc] init];
        
        // 通过setter方法来设置实例变量的值
        // [jim setWeightInKilos:96];
        jim.weightInKilos = 96;
        // [jim setHeightInMeters:1.8];
        jim.heightInMeters = 1.8;
        
        // 通过getter方法来读取实例变量的值
        // int weight = [jim weightInKilos];
        int weight = jim.weightInKilos;
        // float height = [jim heightInMeters];
        float height = jim.heightInMeters;
        NSLog(@"jim的身高为%.2f, 体重为%d", height, weight);
        
        // 计算bmi
        float bmi = [jim bodyMassIndex];
        NSLog(@"Jim的bmi值为: %.2f", bmi);
    }
    return 0;
}
