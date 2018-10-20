/**
 插入排序的实现
 */

import Foundation

/// 按照升序，对数组执行插入排序
///
/// - Parameter array: 一个指定的数组，其元素类型必须遵守Comparable协议
public func insertionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    
    guard array.count >= 2 else { return }
    
    // 遍历数组中除当前元素之外的所有元素
    for current in 1..<array.count {
        
        // 从当前元素开始往后移动
        for shifting in (1...current).reversed() {
            
            // 如果元素顺序不对，就交换元素位置；否则，退出内层循环
            if array[shifting] < array[shifting - 1] {
                array.swapAt(shifting, shifting - 1)
            } else {
                break
            }
        }
    }
}
