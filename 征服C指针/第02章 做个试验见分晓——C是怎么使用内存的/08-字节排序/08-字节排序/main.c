//
//  main.c
//  08-字节排序
//
//  Created by Enrica on 2018/4/21.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    int hoge = 0x12345678;
    unsigned char *hoge_p = (unsigned char *)&hoge;
    
    printf("hoge_p[0]: %x\n", hoge_p[0]);
    printf("hoge_p[1]: %x\n", hoge_p[1]);
    printf("hoge_p[2]: %x\n", hoge_p[2]);
    printf("hoge_p[3]: %x\n", hoge_p[3]);
    
    return 0;
}

/**
 * 从输出的顺序可以看出，数据"0x12345678"在内存中是被逆向存放的，
 * Intel的CPU都是像这样将整数颠倒过来存放。这种配置方式一般称之为
 * 小端(little-endian)字节序。
 *
 * 对于工作站的CPU，一般会将整数"0x12345678"按照"12, 34, 56,
 * 78"的顺序存放，这种配置方式被称之为大端(big-endian)字节序。
 *
 * 像大端和小端这样的字节排序方式，我们一般称之为字节排序(Byte Order)
 */
