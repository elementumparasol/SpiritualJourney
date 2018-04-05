//
//  main.cpp
//  0505-if语句和逻辑运算符
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 在if语句中使用逻辑NOT和AND运算符(!和&&)进行条件处理
 */

#include <iostream>
using namespace std;

int main(void) {
    
    cout << "使用bool值(0或者1)来回答下面的问题。" << endl;
    cout << "现在下雨了吗?: ";
    bool isRaining = true;
    cin >> isRaining;
    
    cout << "你今天点了窖鸡王的烧鸡了吗？: ";
    bool isOrdering;
    cin >> isOrdering;
    
    if (isRaining && isOrdering)
        cout << "有鸡吃！Life is Good!" << endl;
    else
        cout << "下雨天吃鸡本该是极好的！希望你这边只是没有下雨，而不是没有鸡吃！" << endl;
    
    cout << "不管有没有下雨，有没有鸡吃，都要享受生活!" << endl;
    
    return 0;
}
