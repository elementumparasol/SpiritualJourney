//
//  main.c
//  0805-枚举类型
//
//  Created by Enrica on 2018/4/2.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 显示所选动物的叫声
 */

#include <stdio.h>

/**
 * 动物种类
 */
enum animal {
    Dog,
    Cat,
    Monkey,
    Invalid
};

/**
 * 狗叫
 */
void dog(void) {
    puts("汪汪汪！");
}

/**
 * 猫叫
 */
void cat(void) {
    puts("喵~");
}

/**
 * 猴子叫
 */
void monkey(void) {
    puts("叽叽叽叽!");
}

/**
 * 选择动物
 */
enum animal select(void) {  // 这个在Ubuntu平台下的CLion测试是可以通过的，但是在Xcode却不受支持
    int tmp;
    do {
        printf("0...狗   1...猫   2...猴子  3...结束: ");
        scanf("%d", &tmp);
    } while (tmp < Dog || tmp > Invalid);

    return tmp;
}

int main(void) {

    enum animal selected;

    do {

        switch (selected = select()) {
            case Dog:
                dog();
                break;
            case Cat:
                cat();
                break;
            case Monkey:
                monkey();
                break;
        }
    } while (selected != Invalid);

    return 0;
}
