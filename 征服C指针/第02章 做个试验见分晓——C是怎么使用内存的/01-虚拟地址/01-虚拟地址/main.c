//
//  main.c
//  01-虚拟地址
//
//  Created by Enrica on 2018/4/20.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    int hoge;
    char buf[256];
    
    printf("int类型的变量hoge在内存中的地址是: %p\n", &hoge);
    
    printf("请给数组buf赋值: ");
    fgets(buf, sizeof(buf), stdin);
    sscanf(buf, "%d", &hoge);
    
    for (; ;) {
        printf("hoge --- %d\n", hoge);
        
        getchar();
        hoge++;
    }
    
    return 0;
}
