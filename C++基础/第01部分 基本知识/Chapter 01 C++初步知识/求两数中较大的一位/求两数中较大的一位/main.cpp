//
//  main.cpp
//  求两数中较大的一位
//
//  Created by Enrica on 2018/7/18.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>
using namespace std;

int max(int x, int y) {
    
    int tmp;
    
    if (x > y) {
        tmp = x;
    } else {
        tmp = y;
    }
    
    return tmp;
}

int main(int argc, const char * argv[]) {

    int a, b, result;
    
    cout << "请依次输入两个正整数(两数之间用空格隔开): ";
    cin >> a >> b;
    
    // 调用函数max求出两数中较大的一位
    result = max(a, b);
    
    cout << "max = " << result << endl;
    
    return 0;
}
