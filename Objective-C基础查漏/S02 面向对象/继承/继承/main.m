//
//  main.m
//  继承
//
//  Created by Enrica on 2018/8/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "ESPerson.h"
#import "ESEmployee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 创建实例变对象(父类指针指向子类实例对象: 多态)
        // ESPerson *mikey = [[ESEmployee alloc] init];
        ESEmployee *mikey = [[ESEmployee alloc] init];
        
        // 调用setter方法为实例变量设置值
        mikey.heightInMeters = 1.8;
        mikey.weightInKilos = 96;
        
        mikey.employeeID = 12;
        mikey.hireDate = [NSDate dateWithNaturalLanguageString:@"Aug 2nd, 2010"];
        
        // 调用getter方法打印实例变量的值
        NSLog(@"mikey的身高为: %.2f", mikey.heightInMeters);
        NSLog(@"mikey的体重为: %d", mikey.weightInKilos);
        NSLog(@"Employee %u hired on %@", mikey.employeeID, mikey.hireDate);
        
        // 打印mikey的bmi
        float bmi = mikey.bodyMassIndex;
        NSLog(@"mikey的bmi为: %.2f", bmi);
        
        double years = mikey.yearOfEmployment;
        NSLog(@"years = %.2f", years);
    }
    return 0;
}
