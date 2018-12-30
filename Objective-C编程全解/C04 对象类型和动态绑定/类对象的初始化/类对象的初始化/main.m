//
//  main.m
//  类对象的初始化
//
//  Created by Enrica on 2018/12/30.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>


/**
 A类的接口文件
 */
@interface A : NSObject

+ (void)initialize;

@end

/**
 A类的实现文件
 */
@implementation A

+ (void)initialize {
    printf("I'm A\n");
}

@end


/**
 B类的接口文件
 */
@interface B : A

+ (void)initialize;
+ (void)setMessage: (const char *)msg;
- (void)sayHello;

@end

/**
 B类的实现文件
 */
static const char *myMessage = "Hello";
@implementation B

+ (void)initialize {
    printf("I'm B\n");
}

+ (void)setMessage:(const char *)msg {
    myMessage = msg;
}

- (void)sayHello {
    printf("%s\n", myMessage);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 在创建obj对象时，会调用自己的initialize方法
        // 但是，在调用这个方法之前，要先调用父类的initialize
        // 方法，所以会先打印"I'm A"，再打印"I'm B"
        id obj = [[B alloc] init];
        
        [obj sayHello];
        
        [B setMessage:"Have a good day!"];
        [obj sayHello];
    }
    return 0;
}
