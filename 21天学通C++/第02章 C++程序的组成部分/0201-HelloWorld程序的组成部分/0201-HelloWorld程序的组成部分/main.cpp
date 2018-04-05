//
//  main.cpp
//  0201-HelloWorld程序的组成部分
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

// iostream表示标准输入和输出的头文件
#include <iostream>

// 声明main()函数时， 总是在它前面加上int，这是
// 一种标准化的约定，表示main函数的返回值总是为整型
int main(void) {
    
    // 向屏幕输出一条"Hello，World!"信息。其中，std是命名空间，
    // cout(读作see-out)是命名空间std中定义的一个流，用于向屏幕
    // 显示输出内容；"<<"是插入运算符，std::cout << "Hello, World!"
    // 表示将文本"Hello, World!"插入到cout这个流中；而std::endl
    // 则是用于换行的，表示将换行符插入到cout流中
    std::cout << "Hello, World!" << std::endl;
    
    // 向操作系统返回一个值
    return 0;
}
