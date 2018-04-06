//
//  main.cpp
//  0808-手动分配和释放内存块
//
//  Created by Enrica on 2018/4/7.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用new[...]和delete[]来手动管理内存
 */

#include <iostream>
using namespace std;

int main(void) {
    
    cout << "请输入需要存储多少个int类型的元素，以方便确定需要多少存储空间: ";
    int number = 0;
    cin >> number;
    
    // 手动申请内存空间
    int *myIntNumbers = new int[number];
    
    cout << "申请的内存块地址: " << myIntNumbers << endl;
    
    // 释放内存
    delete[] myIntNumbers;
    
    return 0;
}
