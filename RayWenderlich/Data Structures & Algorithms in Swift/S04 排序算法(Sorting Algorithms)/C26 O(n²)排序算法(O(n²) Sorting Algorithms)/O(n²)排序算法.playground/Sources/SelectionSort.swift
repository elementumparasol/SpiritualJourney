/**
 选择排序的实现
 * 选择排序的思想和冒泡排序很像，只不过它不是每次比较之后就交换，
 * 而是等到每一趟的比较完成之后，再进行交换。也就是将数组中最大(小)
 * 的元素和当前元素进行交换。
 *
 * 以数组[9, 4, 10, 3]为例:
 * - 第一趟: 遍历数组，找到元素值最小元素3，然后跟9进行交换，得到数组[3, 4, 10, 9]
 * - 第二趟: 继续遍历数组中剩余元素，找到元素值最小的元素4，但是4在正确的位置，所以不用交换
 * - 第三趟: 继续遍历数组中剩余的元素，找到最小的元素值9，然后跟10进行交换，得到[3, 4, 9, 10]
 */

import Foundation

/// 按照升序，对数组进行选择排序
///
/// - Parameter array: 指定的一个数组，其元素必须遵守Comparable协议
public func selectionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    
    guard array.count >= 2 else { return }
    
    // 遍历数组中所有的元素
    for current in 0..<(array.count - 1) {
        
        // 记录元素值最小的那个元素的下标，默认它的值为当前元素的下标
        var lowest = current
        
        // 遍历除当前元素之外，数组中剩余的元素
        for index in (current + 1)..<array.count {
            
            // 将当前元素和数组中剩余的元素进行比较，
            // 找到最小的那个元素，然后记录它的下标值
            if array[current] > array[index] {
                lowest = index
            }
        }
        
        // 如果当前元素的下标不等于lowest，就说明
        // 当前元素不是最小的元素，则执行交换
        if lowest != current {
            array.swapAt(lowest, current)
        }
    }
}
