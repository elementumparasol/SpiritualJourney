//
//  main.c
//  桶排序
//
//  Created by Enrica on 2018/7/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    // 数组a[11]是用来做桶标记的，我们先将所有的数组元素初始化为0；
    // 因为数组中如果只有部分被初始化，另外没有被初始化的会被自动初始
    // 化为0，因此，我们只需要把数组元素第一个初始化为0，或者干脆就
    // 直接用大括号就可以把数组中所有元素都初始化为0.
    // 变量t是用来存放输入数据的，因此暂时可以不用初始化
    int a[11] = {}, t;
    
    // 循环读入5个数据
    printf("请依次输入5个数据: \n");
    for (int i = 1; i <= 5; i++) {
        
        // 将读取到的数据存入变量t中
        scanf("%d", &t);
        
        // 记录输入的数据出现的次数
        a[t]++;
    }
    
    // 一次判断a[0]~a[10]
    for (int i = 0; i <= 10; i++)
        
        // 出现了几次就打印几次
        for (int j = 1; j <= a[i]; j++)
            printf("%d  ", i);
    
    return 0;
}
