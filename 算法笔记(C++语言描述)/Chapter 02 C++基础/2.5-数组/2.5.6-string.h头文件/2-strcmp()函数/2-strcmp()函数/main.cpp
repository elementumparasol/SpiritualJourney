//
//  main.cpp
//  2-strcmp()函数
//
//  Created by Enrica on 2018/7/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>
#include <cstring>

int main(int argc, const char * argv[]) {
    
    // strcmp()函数返回两个字符串大小的比较结果，比较原则是按字典顺序:
    // - (1)、如果str1 < str2，那么strcmp()函数的返回值为一个负数；
    // - (2)、如果str1 == str2，那么strcmp()函数的返回值为0；
    // - (3)、如果str1 > str2，那么strcmp()函数的返回值为一个正数
    char str1[50], str2[50];
    
    printf("请分别输入两个字符串: \n");
    gets(str1);
    gets(str2);
    
    int cmp = strcmp(str1, str2);
    
    if (cmp < 0) printf("str1 < str2\n");
    else if (cmp > 0) printf("str1 > str2\n");
    else printf("str1 == str2");
    
    return 0;
}
