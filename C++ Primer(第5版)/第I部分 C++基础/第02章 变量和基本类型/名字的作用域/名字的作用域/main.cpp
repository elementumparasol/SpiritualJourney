//
//  main.cpp
//  名字的作用域
//
//  Created by Enrica on 2018/7/18.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    // 变量sum的作用域在整个main函数内部
    int sum = 0;
    
    // 变量val的作用域只在for循环这个代码段内部，
    // 出了这个代码段就无效
    for (int val = 1; val <= 10; ++val) {
        sum += val;
    }
    
    std::cout << "从1到10的累加结果为: " << sum << std::endl;
    
    return 0;
}
