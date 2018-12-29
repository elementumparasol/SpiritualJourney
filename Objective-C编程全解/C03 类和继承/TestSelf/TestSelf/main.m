//
//  main.m
//  TestSelf
//
//  Created by Enrica on 2018/12/30.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface A : NSObject

- (void)method1;
- (void)method2;

@end

@implementation A

- (void)method1 {
    printf("method1 of Class A\n");
}

- (void)method2 {
    printf("method2 of Class A\n");
}

@end


@interface B : A

// 重写method2方法
- (void)method2;

@end

@implementation B

- (void)method2 {
    printf("method2 of Class B\n");
    printf("self ---> ");
    [self method1];
    printf("super ---> ");
    
    // 这里不能通过self调用method2，因为会产生死循环
    [super method2];
}

@end


@interface C : B

// 重写method1方法
- (void)method1;

@end

@implementation C

- (void)method1 {
    printf("method1 of Class C\n");
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        id b = [[B alloc] init];
        id c = [[C alloc] init];
        
        printf("\n--- instance of B ---\n");
        
        // B类继承了A类中的method1，此时调用的是父类A的method1方法
        [b method1];
        
        // (1)、B类重写了父类A的method2方法，此时调用的是自己的方法
        // (2)、但是，如果在重写的方法method2中通过self调用method1，
        // 则实际上调用的是父类的method1方法；如果在重写的方法method2
        // 中通过super调用method2方法，则实际调用的是父类的方法。在重写
        // 的父类方法method2中不能通过self调用method2
        [b method2];
        
        printf("\n--- instance of C ---\n");
        
        // C类重写了method1，此时调用的是自己的方法
        [c method1];
        
        // C类没有重写method2方法，所以这里调用的是父类B的method2方法
        // 因为C类中重写了method1方法，所以在method2中如果通过self调用
        // method1方法，则调用的是自己的method1方法
        [c method2];
    }
    return 0;
}
