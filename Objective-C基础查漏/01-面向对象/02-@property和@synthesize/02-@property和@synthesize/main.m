//
//  main.m
//  02-@property和@synthesize
//
//  Created by Enrica on 2018/4/13.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [Person new];
        p.age = 20;
        p.name = @"James";
        NSLog(@"p.age = %d, p.name = %@\n", p.age, p.name);
    }
    return 0;
}
