//
//  main.cpp
//  2.1-基本数据类型
//
//  Created by Enrica on 2018/7/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>
#include <cstdio>

/**
 * C++是C的超级，因此，可以直接在C++文件中写C代码。只不过，在C++文件中导入
 * C的头文件时，不再是导入.h文件，而是导入的时候去掉.h，并且在文件名开头加上
 * 小写字母c，eg: 在C语言中导入标准输入输出文件#include <stdio.h>，在C++
 * 中则变成了#include <cstdio>，类似的有#include <cmath>、#include <cstring>等等
 */

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    printf("Hello, World!\n");
    return 0;
}
