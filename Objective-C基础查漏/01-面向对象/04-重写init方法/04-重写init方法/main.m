//
//  main.m
//  04-重写init方法
//
//  Created by Enrica on 2018/4/13.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // +new相当于一次性调用+alloc和+init
        Person *p = [[Person alloc] init];
        
        NSLog(@"p.age = %d, p.name = %@\n", p.age, p.name);
    }
    return 0;
}
