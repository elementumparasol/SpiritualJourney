//
//  main.cpp
//  1.4.3-读取数量不定的输入数据
//
//  Created by Enrica on 2018/7/18.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    int sum = 0, val = 0;
    
    std::cout << "请连续输入正整数: ";
    
    while (std::cin >> val) {
        sum += val;
    }
    
    std::cout << "sum的结果为: " << sum << std::endl;
    
    return 0;
}

// 这个程序不会被终止，除非遇到了文件终止符EOF(macOS中按住Ctrl + D)
