//
//  main.m
//  08-类的加载和初始化
//
//  Created by Enrica on 2018/4/16.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

/**
 * (1)、程序启动时，会加载项目中所有的类和分类，然后就会调用每个类或者分类的+load方法(只调用一次)；
 * (2)、当我们第一次使用某个类时，程序就会自动调用该类的+initialize方法；
 * (3)、调用和初始化顺序是：先调用父类的+load或者+initialize方法，然后再调用子类的+load或者+initialize方法。
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 创建Student对象
        // 因为Person是Student的父类，因此使用Student对象时，Person的initialize方法也会被调用
        Student *stu = [[Student alloc] init];
        
        NSLog(@"%@", stu);
    }
    return 0;
}
