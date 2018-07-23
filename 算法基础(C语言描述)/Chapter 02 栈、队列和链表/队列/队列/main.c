//
//  main.c
//  队列
//
//  Created by Enrica on 2018/7/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <stdio.h>

struct queue {
    
    // 队列的主体，用来存放数据
    int data[50];
    
    // 队首
    int head;
    
    // 队尾
    int tail;
};

int main(int argc, const char * argv[]) {
    
    struct queue q;
    
    // 初始化队列
    q.head = 1;
    q.tail = 1;
    printf("请依次输入需要处理的数据: ");
    for (int i = 1; i <= 9; i++) {
        
        // 依次向队列中插入9个数据
        scanf("%d", &q.data[q.tail]);  // 队列是受限制的线性结构，只能在队列的末尾插入数据
        q.tail++;
    }
    
    // 当队列不为空时，执行循环操作
    while (q.head < q.tail) {
        
        // 打印队首元素，并且将队首元素出队列
        printf("%d  ", q.data[q.head]);
        q.head++;
        
        // 先将新队首的数添加到队首
        q.data[q.tail] = q.data[q.head];
        q.tail++;
        
        // 再将队首出队列
        q.head++;
    }
    
    return 0;
}
