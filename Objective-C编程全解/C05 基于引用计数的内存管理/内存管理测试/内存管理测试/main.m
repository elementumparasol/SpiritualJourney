//
//  main.m
//  内存管理测试
//
//  Created by Enrica on 2018/12/30.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    id obj = [[NSObject alloc] init];
    printf("init: %d\n", (int)[obj retainCount]);
    
    [obj retain];
    printf("retain: %d\n", (int)[obj retainCount]);
    
    [obj retain];
    printf("retain: %d\n", (int)[obj retainCount]);

    [obj release];
    printf("release: %d\n", (int)[obj retainCount]);
    
    [obj release];
    printf("release: %d\n", (int)[obj retainCount]);
    
    [obj release];
    printf("release: %d\n", (int)[obj retainCount]);
    
    return 0;
}
