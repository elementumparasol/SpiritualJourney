//
//  main.cpp
//  0401-声明一个int数组并访问其元素
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <iostream>
using namespace std;

int main(void) {
    
    // 声明并初始化一个int数组
    int intArray[5] = {34, 56, -21, 45, 77};  // 因为所有的元素都被初始化了，因此中括号中数组长度可以省略
    
    // 依次访问数组中的元素
    cout << "数组的第一个元素: " << intArray[0] << endl;
    cout << "数组的第二个元素: " << intArray[1] << endl;
    cout << "数组的第三个元素: " << intArray[2] << endl;
    cout << "数组的第四个元素: " << intArray[3] << endl;
    cout << "数组的第五个元素: " << intArray[4] << endl;
    
    return 0;
}
