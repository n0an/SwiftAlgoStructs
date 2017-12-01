//
//  SortTest.swift
//  SwiftAlgoStructsTests
//
//  Created by Anton Novoselov on 01/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation
import XCTest
import GameKit

@testable import SwiftAlgoStructs

class SortTest:XCTestCase, Sortable {
    
    //test input types for algorithms
    var numberList = [8, 2, 10, 9, 7, 5]
    var searchList = [0,4,7,9,13,16,34]
    
    var trivialNumberList = [1]
    
    var emptyNumberList: Array<Int> = []
    
    var textList = ["Dog", "Cat", "Dinasour", "Lion", "Cheetah", "Gazelle", "Elephant", "Aardvark"]
    
    var triviaTextList = ["Dog"]
    var emptyTextList: Array<String> = []
    
    let duplicatesRatio = 0.999
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testQuickSort() {
        
        let arrayToSort = Array(1...ArraySize.k1.rawValue)

        let shuffledArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arrayToSort) as! [Int]
        
        let start = Date()
        
        print("Start to sort")
        
        let sortedArr = quickSort(array: shuffledArray)
        
        print("shuffled")
        
        let timePassed = Date().timeIntervalSince(start)
        
        print("timePassed = \(timePassed)")
        
        XCTAssertTrue(isSorted(sortedArr))
        
        // O(n log n)
        // 1000     - 0.008
        // 10000    - 0.083
        // 100000   - 0.956
        // 1000000  - 11.570
        
    }
    
    func testQuickSortWithDuplicates() {
        
        let arraySize = ArraySize.k2.rawValue
        
        let arrWithDuplicates = Array<Int>(repeating: 100, count: Int(Double(arraySize) * duplicatesRatio))
        let arrNonDuplicates = Array(101...100 + arraySize - arrWithDuplicates.count)
        
        let arr = arrWithDuplicates + arrNonDuplicates
        
        let shuffledArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arr) as! [Int]
        
        let start = Date()
        
        print("Start to sort")
        
        let sortedArr = quickSort(array: shuffledArray)
        
        print("shuffled")
        
        let timePassed = Date().timeIntervalSince(start)
        
        print("timePassed = \(timePassed)")
        
        XCTAssertTrue(isSorted(sortedArr))
        
        // O(n²)
        // 1000     - 0.089
        // 2000     - 0.425
        // 10000    - 8.796
        
    }
    
    func testQuickSortAlreadySortedArray() {
        let arr = Array(1...ArraySize.k1.rawValue)

        let start = Date()
        
        print("Start to sort")
        
        let sortedArr = quickSort(array: arr)
        
        print("shuffled")
        
        let timePassed = Date().timeIntervalSince(start)
        
        print("timePassed = \(timePassed)")
        
        XCTAssertTrue(isSorted(sortedArr))
        
        // O(n²)
        // 1000     - 0.131
        // 2000     - 0.398
        // 10000    - 8.918
        
    }
    
}
