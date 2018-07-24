//
//  main.cpp
//  2.5.5.2.3-gets和puts
//
//  Created by Enrica on 2018/7/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    char str1[20];
    char str2[5][10];
    
    printf("请输入一个字符串，将其存入str1中: \n");
    gets(str1);  // warning: this program uses gets(), which is unsafe.
    
    printf("输出结果如下: \n");
    
    // 输出str1中的字符
    puts(str1);
    
    printf("\n请输入一些字符串，将其存入str2中: \n");
    
    // 输入一些字符并存入str2中
    for (int i = 0; i < 3; i++) {
        gets(str2[i]);
    }
    
    printf("\n输出结果如下: \n");
    
    // 输出str2中的字符
    for (int i = 0; i < 3; i++) {
        puts(str2[i]);
    }
    
    return 0;
}
