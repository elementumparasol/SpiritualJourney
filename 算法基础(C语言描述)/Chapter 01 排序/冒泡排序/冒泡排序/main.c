//
//  main.c
//  冒泡排序
//
//  Created by Enrica on 2018/7/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    int a[50] = {}, n;
    
    printf("请确定需要对多少个数字进行排序: ");
    
    // 输入一个数据n，用来表示接下来要对n个数据进行排序
    scanf("%d", &n);
    
    printf("请依次录入需要进行排序的数据: ");
    
    // 循环读取n个数字
    for (int i = 1; i <= n; i++) {
        
        // 将读取的数据存储到数组a中
        scanf("%d", &a[i]);
    }
    
    // 对n个数进行排序，只需进行n - 1趟
    for (int i = 1; i <= n - 1; i++) {
        
        // 从第一位开始比较直到最后一个尚未归为的数字，n - i就可以了
        for (int j = 1; j <= n - i; j++) {
            
            // 如果a[j] < a[j + 1]
            if (a[j] > a[j + 1]) {
                
                // 交换a[j]和a[j + 1]的位置
                int tmp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = tmp;
            }
        }
    }
    
    // 输出排序之后的数字
    for (int i = 1; i <= n; i++) {
        printf("%d  ", a[i]);
    }
    
    printf("\n");
    
    return 0;
}
