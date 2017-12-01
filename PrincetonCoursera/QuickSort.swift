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
        
//        print("------------")
//        print("entering partition, a[lo] = \(arr[lo])")
//        print("lo, hi = \(lo, hi)")
        
        var i = lo
        var j = hi + 1
        
        mainLoop: while true {
            
            // rewind i
            insideLoop: repeat {
                i += 1
                if i == hi {
                    break insideLoop
                }
            } while arr[i] < arr[lo]
          
//            print("found a[i] > a[lo] = \(arr[i])")
//            print("i = \(i)")
            
            // rewind j
            insideLoop: repeat {
                j -= 1
                if j == lo {
                    break insideLoop
                }
            } while arr[lo] < arr[j]
            
//            print("found a[j] < a[lo] = \(arr[j])")
//            print("j = \(j)")

            if i >= j {
                break mainLoop
                
            }
            
//            print("swapping a[i] and a[j] = \(arr[i], arr[j])")
            arr.swapAt(i, j)
        }
        
//        print("final swap a[lo] and a[j] = \(arr[lo], arr[j])")
        arr.swapAt(lo, j)
        
        return j
    }
    
}





