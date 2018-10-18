/**
 折半查找的实现
 */

import Foundation

/**
 折半查找，又称二分查找，它必须满足两个条件:
 - 所需查找的集合必须确保能够在常量时间内执行索引操作(就是支持索引操作)
 - 所需查找集合中的元素必须是按照升序或者降序排列(即事先需要进行排序)
 另外，在Swift中，只有遵守RandomAccessCollection协议的类型才能够
 使用折半查找，并且在进行折半查找的过程中需要对集合中的元素进行比较，为此
 我们可以跟RandomAccessCollection扩展一个执行折半查找的方法，并且还需
 确保集合中的元素遵守Comparable协议
 */
public extension RandomAccessCollection where Element: Comparable {
    
    
    /// 在一个已经排序的集合中执行折半查找
    ///
    /// - Parameters:
    ///   - value: 需要查找元素的值
    ///   - range: 查找范围
    /// - Returns: 如果查找成功，则返回集合中与指定的值相等元素的索引；否则，返回nil
    func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        
        // 检查查找范围range是否为nil。如果是，则创建一个包含整个集合的索引范围
        let range = range ?? startIndex..<endIndex
        
        // 检查索引范围是否合法(如果范围的最小边界不小于最大边界，就说明该范围之内没有元素)
        guard range.lowerBound < range.upperBound else { return nil }
        
        // 寻找索引范围的中间点
        let size = distance(from: range.lowerBound, to: range.upperBound)
        let middle = index(range.lowerBound, offsetBy: size / 2)
        
        // 根据索引范围的中间点取出集合中的元素，然后跟指定的value作比较
        if self[middle] == value {
            
            // 如果刚好相等，则查找成功，直接返回中间点middle
            return middle
        } else if self[middle] > value {
            
            // 如果从集合中取出的元素值比指定的值value大，那么就在
            // 中间点左边的范围内递归调用折半查找方法，直到找到为止
            return binarySearch(for: value, in: range.lowerBound..<middle)
        } else {
            
            // 如果从集合中取出的元素值不比指定的值value大，那么就在
            // 中间点右边的范围内递归调用折半查找方法，直到找到为止
            return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
        }
    }
    
}
