//
//  main.cpp
//  0616-使用嵌套循环计算斐波拉契数列
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用嵌套循环计算斐波拉契数列
 */

#include <iostream>
using namespace std;

int main(void) {
    
    const int numsToCalculate = 5;
    cout << "这个程序用于一次性计算" << numsToCalculate << "个斐波拉契数字。" << endl;
    
    int firstValue = 0, secondValue = 1;
    char wantMore = '\0';
    cout << firstValue << " " << secondValue << " " << endl;
    
    do {
        for (int i = 0; i < numsToCalculate; ++i) {
            cout << firstValue + secondValue << " ";
            int num2Tmp = secondValue;
            secondValue = firstValue + secondValue;
            firstValue = num2Tmp;
        }
        
        cout << endl << "你想要计算更多的数据吗？(y/n): ";
        cin >> wantMore;
    } while (wantMore == 'y');
    
    cout << "谢谢使用，再见！" << endl;
    
    return 0;
}
