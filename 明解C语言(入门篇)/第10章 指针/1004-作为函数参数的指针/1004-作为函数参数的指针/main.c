//
//  main.c
//  1004-作为函数参数的指针
//
//  Created by Enrica on 2018/4/4.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 通过指针间接修改身高
 */

#include <stdio.h>

/**
 * 让身高不足180的人长到180
 */
void enrica(int *height) {
    
    if (*height < 180)
        *height = 180;
}

int main(void) {
    
    int me = 172;
    
    // 因为函数参数通常都是值传递，是一种
    // 临时性的复制，对原始数据并不能产生
    // 影响。为此，如果需要通过函数来修改
    // 原始数据，那么就应该通过指针来修改
    enrica(&me);
    
    printf("我的身高是: %d\n", me);
    
    return 0;
}
