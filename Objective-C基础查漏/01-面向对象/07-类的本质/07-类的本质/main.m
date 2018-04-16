//
//  main.m
//  07-类的本质
//
//  Created by Enrica on 2018/4/16.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 类本身也是一个特殊的对象，它的类型是Class。在内存中，
        // 有且仅有一块内存是用来存放类对象的(类对象只有一个)，
        // 一个类对象可以实例化多个实例对象，并且这些实例对象中
        // 一定有一个isa指针变量是指向类对象的。
        Person *p1 = [[Person alloc] init];
        Person *p2 = [[Person alloc] init];
        
        // 通过Person的对象方法class类获取类对象
        Class c1 = [p1 class];
        Class c2 = [p2 class];
        
        // 因为内存中有且仅有一个类对象，因此，使用不同的实例对象
        // 所得到的类对象，它应该是同一个，即c1应该是和c2是同一个
        NSLog(@"c1 = %p, c2 = %p", c1, c2);  // 因为Class本身就包含有*，所以这里c1和c2其实就是指针
        
        // 还可以通过Person的类方法类获取类对象
        Class c3 = [Person class];
        NSLog(@"c2 = %p, c3 = %p", c2, c3);
    }
    return 0;
}
