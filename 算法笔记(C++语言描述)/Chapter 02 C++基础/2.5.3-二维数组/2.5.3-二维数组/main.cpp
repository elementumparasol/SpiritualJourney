//
//  main.cpp
//  2.5.3-二维数组
//
//  Created by Enrica on 2018/7/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>
#include <cstdio>

int main(int argc, const char * argv[]) {
    
    int a[3][3], b[3][3];
    
    printf("请输入二维数组a的元素: ");
    
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            
            // 输入二维数组a的元素
            scanf("%d", &a[i][j]);
        }
    }
    
    printf("请输入二维数组b的元素: ");
    
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            
            // 输入二维数组a的元素
            scanf("%d", &b[i][j]);
        }
    }
    
    int c[3][3];
    
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            
            // 将数组a和b中对应位置的元素相加
            c[i][j] = a[i][j] + b[i][j];
        }
    }
    
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            
            // 输出二维数组c的元素
            printf("%d ", c[i][j]);
        }
        
        printf("\n");
    }
    
    
    
    return 0;
}
