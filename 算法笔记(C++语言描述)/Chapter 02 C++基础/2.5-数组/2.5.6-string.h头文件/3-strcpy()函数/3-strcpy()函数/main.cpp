//
//  main.cpp
//  3-strcpy()函数
//
//  Created by Enrica on 2018/7/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>
#include <cstring>

int main(int argc, const char * argv[]) {
    
    // strcpy()函数可以把一个字符串复制给另外一个字符串.其格式为:
    // strcpy(str1, str2); 即把字符串str2中的内容复制给字符串str1
    char str1[50], str2[50];
    printf("请输入一个字符串，并且将其存储到字符串str1中: \n");
    gets(str1);
    
    // 将字符串str1中的内容输出到字符串str2中
    strcpy(str2, str1);
    
    puts(str2);
    
    return 0;
}
