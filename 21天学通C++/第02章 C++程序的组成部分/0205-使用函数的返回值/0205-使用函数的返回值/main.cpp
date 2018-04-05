//
//  main.cpp
//  0205-使用函数的返回值
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <iostream>
using namespace std;

// 声明并定义函数
int DemoConsoleOutput() {
    
    cout << "这只是一个简单的文本输入。" << endl;
    cout << "pi = " << 22.0 / 7 << endl;
    
    return 0;
}

int main(void) {
    
    // 将函数调用的返回值作为退出程序时的返回值
    return DemoConsoleOutput();
}
