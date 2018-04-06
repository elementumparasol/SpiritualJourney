//
//  main.cpp
//  0809-使用偏移量和运算符来计算指针
//
//  Created by Enrica on 2018/4/7.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用偏移量和运算符来递增或者递减指针
 */

#include <iostream>
using namespace std;

int main(void) {
    
    cout << "你希望存储多少个整型数据: ";
    int num;
    cin >> num;
    
    // 手动分配内存空间
    int *pointToInts = new int [num];
    
    // 像新分配的内存中写入数据
    cout << "需要为" << num << "个int类型的整数分配内存空间。" << endl;
    for (int counter = 0; counter < num; ++counter) {
        cout << "请输入第" << counter + 1 << "个整数: ";
        
        // 将输入的数据写入新分配的内存空间(指针变量所指向的内存空间)
        cin >> *(pointToInts + counter);  // 使用偏移量counter将用户输入的值直接存储到内存中
    }
    
    // 从新分配的内存中读取数据
    cout << "输出所有输入的数据: " << endl;
    for (int counter = 0; counter < num; ++counter) {
        cout << *(pointToInts++) << " ";  // 使用自增运算符将指针所包含的地址进行递增，让指针指向下一个元素
    }
    cout << endl;
    
    // 让指针pointToInts重新指向原来的地址
    // 注意，使用delete [] 来释放内存时，必
    // 须指定分配内存时new返回的指针地址
    pointToInts -= num;  // 这句代码不能少，否则系统会报错: pointer being freed was not allocated
    
    // 释放已经分配的内存空间
    delete [] pointToInts;
    
    return 0;
}
