//
//  main.m
//  05-自定义构造方法
//
//  Created by Enrica on 2018/4/14.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [[Person alloc] initWithName:@"James" andAge:20];
        
        NSLog(@"p.name = %@, p.age = %d", p.name, p.age);
        
        Student *stu = [[Student alloc] initWithName:@"Lucy" andAge:22 number:1801];
        
        NSLog(@"stu.name = %@, stu.age = %d, stu.number = %d", stu.name, stu.age, stu.number);
    }
    return 0;
}
