//
//  main.m
//  构造方法
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESPerson.h"
#import "ESStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 创建ESPerson对象
        ESPerson *p = [[ESPerson alloc] init];
        
        NSLog(@"p.age = %d, p.name = %@", p.age, p.name);
        
        // 使用自定义的初始化方法创建对象
        ESPerson *james = [[ESPerson alloc] initWithAge:22 andName:@"James"];
        
        NSLog(@"james.age = %d, james.name = %@", james.age, james.name);
    }
    return 0;
}
