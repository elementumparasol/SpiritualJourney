//
//  main.cpp
//  0602-有条件的执行多条语句
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 将字符串复制到char数组中之前，先检查数组的容量
 */

#include <iostream>
#include <string>
#include <string.h>
using namespace std;

int main(void) {
    
    cout << "请输入一行文本字符串: ";
    string userInput;
    cin >> userInput;
    
    char copyInput[20] = { '\0' };
    
    // 虽然说if-else结构像下面这样写也是对的，但是
    // 一般最好是连在一起写，因为连载一起方便阅读和理解
    if (userInput.length() < 20) {
        strcpy(copyInput, userInput.c_str());
        cout << "复制的文本数据: " << copyInput << endl;
    }
    
    else {
        cout << "字符数量超出了数组的最大容量，因此放弃复制。" << endl;
    }
    
    return 0;
}
