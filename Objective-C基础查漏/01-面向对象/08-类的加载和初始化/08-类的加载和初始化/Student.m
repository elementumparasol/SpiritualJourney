//
//  Student.m
//  08-类的加载和初始化
//
//  Created by Enrica on 2018/4/16.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import "Student.h"

@implementation Student

// 当程序启动时，系统会加载项目中所有的类，不管你有没有使用这些类，
// 它都会被加载。类加载完毕，就会自动调用类方法+load。先调用父类
// 的load方法，然后再调用子类的load方法
+ (void)load {
    
    NSLog(@"Student --- load");
}

// 当类被第一次使用时，就会调用类方法+initialize(只有调用一次)
+ (void)initialize
{
    NSLog(@"Student --- initialize");
}

@end
