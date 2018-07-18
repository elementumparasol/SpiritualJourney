//
//  main.cpp
//  求两数之和
//
//  Created by Enrica on 2018/7/18.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {

    // 定义变量
    int a, b, sum;
    
    cout << "请依次输入两个正整数(用空格隔开): ";
    cin >> a >> b;
    
    // 计算这两个变量之和
    sum = a + b;
    
    // 输出这两个变量之和
    cout << a << " + " << b << " = " << sum << endl;
    
    return 0;
}


