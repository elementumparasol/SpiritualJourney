//
//  main.cpp
//  0614-嵌套循环
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用嵌套循环将一个数组的每个元素与另一个数组的每个元素进行相乘
 */

#include <iostream>
using namespace std;

int main(void) {
    
    const int ARRAY1_LENGTH = 3;
    const int ARRAY2_LENGTH = 2;
    
    int myArray1[ARRAY1_LENGTH] = {35, -3, 0};
    int myArray2[ARRAY2_LENGTH] = {20, -1};
    
    cout << "将数组myArray1和myArray2中的每个元素进行相乘: " << endl;
    
    // 先遍历myArray1
    for (int i = 0; i < ARRAY1_LENGTH; i++) {
        
        // 再遍历myArray2
        for (int j = 0; j < ARRAY2_LENGTH; j++) {
            
            // 最后再将myArray1[i]和myArray2[j]进行相乘
            cout << myArray1[i] << " * " << myArray2[j] << " = ";
            cout << myArray1[i] * myArray2[j] << endl;
        }
    }
    
    return 0;
}
