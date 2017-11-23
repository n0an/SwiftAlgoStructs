//
//  Sorting.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 22/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

/// O(log n)
func binarySearch(inArray array: [Int], forElement key: Int) -> Int? {
    
    var result: Int? = nil
    
    // indices
    let minIndex = array.startIndex
    let maxIndex = array.endIndex - 1
    let midIndex = array.startIndex + array.count / 2
    
    // check bounds
    if key > array[maxIndex] || key < array[minIndex] {
        print("Key is out of bounds")
        return nil
    }
    
    // evaluate chosen number
    let num = array[midIndex]
    
    print("\(num) value attempted")
    
    if num > key {
        let slice = Array(array[minIndex...midIndex - 1])
        result = binarySearch(inArray: slice, forElement: key)
        
    } else if num < key {
        let slice = Array(array[midIndex + 1...maxIndex])
        result = binarySearch(inArray: slice, forElement: key)
    } else {
        print("Search value \(key) found!")
        result = key
    }
    
    return result
    
}


/// Avg: O(n²)
func insertionSort(array: [Int]) -> [Int] {
    
    // trivial case
    guard array.count > 1 else {
        return array
    }
    
    var outputArray = array
    
    for primaryIndex in 0 ..< outputArray.count {
        
        let key = outputArray[primaryIndex]
        
        var secondaryIndex = primaryIndex
        
        while secondaryIndex > -1 {
            if key < outputArray[secondaryIndex] {
                // move to correct position
                outputArray.remove(at: secondaryIndex + 1)
                outputArray.insert(key, at: secondaryIndex)
            }
            
            secondaryIndex -= 1
        }
    }
    
    return outputArray
}


/// Avg: O(n²)
func bubbleSort(array: [Int]) -> [Int] {

    // trivial case
    guard array.count > 1 else {
        return array
    }
    
    var outputArray = array
    
    for primaryIndex in 0 ..< outputArray.count {
        
        let passes = outputArray.count - 1 - primaryIndex
        
        for secondaryIndex in 0 ..< passes {
            let key = outputArray[secondaryIndex]
            
            // compare / swap
            if key > outputArray[secondaryIndex + 1] {
                outputArray.swapAt(secondaryIndex, secondaryIndex + 1)
            }
            
        }
        
    }
    
    return outputArray
}

/// Avg: O(n²)
func selectioinSort(array: [Int]) -> [Int] {
    
    // trivial case
    guard array.count > 1 else {
        return array
    }
    
    var outputArray = array
    
    for primaryIndex in 0 ..< outputArray.count {
        
        var indexOfMin = primaryIndex
        
        var secondaryIndex = primaryIndex + 1
        
        while secondaryIndex < outputArray.count {
            
            // store lowest value as minimum
            if outputArray[indexOfMin] > outputArray[secondaryIndex] {
                indexOfMin = secondaryIndex
            }
            
            secondaryIndex += 1
        }
        
        // swap minimum value with array iteration
        if primaryIndex != indexOfMin {
            outputArray.swapAt(primaryIndex, indexOfMin)
        }
    }
    
    return outputArray
}


/// O(n * log n)
func quickSort(array: [Int]) -> [Int] {
    
    var outputArray = array
    
    qSort(array: &outputArray, startIndex: 0, pivotIndex: array.endIndex - 1)
    
    return outputArray
    
}

func qSort(array: inout [Int], startIndex: Int, pivotIndex: Int) {
    
    if startIndex < pivotIndex {
        
        let iPivotIndex = qPartition(array: &array, startIndex: startIndex, pivotIndex: pivotIndex)
        
        qSort(array: &array, startIndex: startIndex, pivotIndex: iPivotIndex - 1)
        qSort(array: &array, startIndex: iPivotIndex + 1, pivotIndex: pivotIndex)
        
    }
}


func qPartition(array: inout [Int], startIndex: Int, pivotIndex: Int) -> Int {
    
    var wallIndex = startIndex
    
    // compare range with pivot
    for currentIndex in wallIndex ..< pivotIndex {
        
        if array[currentIndex] <= array[pivotIndex] {
            
            if wallIndex != currentIndex {
                array.swapAt(currentIndex, wallIndex)
            }
            
            // advance wall
            wallIndex += 1
        }
    }
    
    // move pivot to final position
    if wallIndex != pivotIndex {
        array.swapAt(wallIndex, pivotIndex)
    }
    
    return wallIndex
    
}






















