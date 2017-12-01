//
//  QuickSort.swift
//  PrincetonCoursera
//
//  Created by Anton Novoselov on 01/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

public class Quick {
    
    public static func sort<T: Comparable>(arr: [T]) -> [T] {
        var outputArray = arr
        sort(arr: &outputArray, lo: 0, hi: arr.count - 1)
        return outputArray
    }
    
    private static func sort<T: Comparable>(arr: inout [T], lo: Int, hi: Int) {
        
        guard hi > lo else { return }
        
        let j = partition(arr: &arr, lo: lo, hi: hi)
        
        sort(arr: &arr, lo: lo, hi: j - 1)
        sort(arr: &arr, lo: j + 1, hi: hi)
        
    }
    
    private static func partition<T: Comparable>(arr: inout [T], lo: Int, hi: Int) -> Int {
        
        var i = lo
        var j = hi
        
        mainLoop: while true {
            insideILoop: while arr[i] < arr[lo] {
                i += 1
                if i == hi {
                    break insideILoop
                }
            }
            
            insideJLoop: while arr[j] > arr[lo] {
                j -= 1
                if j == lo {
                    break insideJLoop
                }
            }
            
            if i >= j {
                break mainLoop
            }
            
            arr.swapAt(i, j)
        }
        
        arr.swapAt(lo, j)
        
        return j
    }
    
}





