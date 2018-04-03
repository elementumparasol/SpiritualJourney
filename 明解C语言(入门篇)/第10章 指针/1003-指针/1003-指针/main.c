//
//  main.c
//  1003-指针
//
//  Created by Enrica on 2018/4/4.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 通过指针间接的操作数据
 */

#include <stdio.h>

int main(void) {
    
    int james = 213;
    int anthony = 203;
    int wade = 193;
    
    // 定义指针
    int *jp, *ap;
    
    // 将指针指向变量
    jp = &james;
    ap = &anthony;
    
    // 通过指针获取指向变量的数据
    printf("James的身高是: %d\n", *jp);
    printf("Anthony的身高是: %d\n", *ap);
    
    // 将指针jp指向Wade
    jp = &wade;
    
    // 修改指针ap所指向变量的值
    *ap = 213;
    
    printf("Wade的身高是: %d\n", *jp);
    printf("Anthony的身高修改之后的值是: %d\n", *ap);
    
    return 0;
}
