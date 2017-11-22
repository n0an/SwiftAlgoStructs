//
//  Sorting.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 22/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation


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
    
    return key
    
    
}
