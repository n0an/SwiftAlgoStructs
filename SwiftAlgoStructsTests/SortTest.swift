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
    
    let duplicatesRatio = 1.0
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testQuickSortDifferentTypesArrays() {
        
        XCTAssertTrue(isSorted(numberList.quickSort()))
        XCTAssertTrue(isSorted(trivialNumberList.quickSort()))
        XCTAssertTrue(isSorted(emptyNumberList.quickSort()))
        XCTAssertTrue(isSorted(textList.quickSort()))
        XCTAssertTrue(isSorted(triviaTextList.quickSort()))
        XCTAssertTrue(isSorted(emptyTextList.quickSort()))
        
    }
    
    func testQuickSort() {
        
        let arrayToSort = Array(1...ArraySize.k10.rawValue)

        var shuffledArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arrayToSort) as! [Int]
        
        let start = Date()
        
        print("Start to sort")
        
//        let sortedArr = quickSort(array: shuffledArray)
        let sortedArr = shuffledArray.quickSort()

        print("shuffled")
        
        let timePassed = Date().timeIntervalSince(start)
        
        print("timePassed = \(timePassed)")
        
        XCTAssertTrue(isSorted(sortedArr))
        
        // O(n log n)
        // 1000     - 0.008
        // 10_000    - 0.083
        // 100_000   - 0.956
        // 1_000_000  - 11.570
        
    }
    
    func testQuickSortWithDuplicates() {
        
        let arraySize = ArraySize.k10.rawValue
        
        let arrWithDuplicates = Array<Int>(repeating: 100, count: Int(Double(arraySize) * duplicatesRatio))
        
        var arrNonDuplicates = [Int]()
        if duplicatesRatio != 1.0 {
            arrNonDuplicates = Array(101...100 + arraySize - arrWithDuplicates.count)
        }
        
        let arr = arrWithDuplicates + arrNonDuplicates
        
        var shuffledArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arr) as! [Int]
        
        let start = Date()
        
        print("Start to sort")
        
        let sortedArr = shuffledArray.quickSort()

        print("shuffled")
        
        let timePassed = Date().timeIntervalSince(start)
        
        print("timePassed = \(timePassed)")
        
        XCTAssertTrue(isSorted(sortedArr))
        
        // O(n log n)
        // 1000     - 0.089
        // 2000     - 0.425
        // 10_000    - 8.796
        
    }
    
    func testQuickSortAlreadySortedArray() {
        var arr = Array(1...ArraySize.k1.rawValue)

        let start = Date()
        
        print("Start to sort")
        
//        let sortedArr = quickSort(array: arr)
        let sortedArr = arr.quickSort()

        print("shuffled")
        
        let timePassed = Date().timeIntervalSince(start)
        
        print("timePassed = \(timePassed)")
        
        XCTAssertTrue(isSorted(sortedArr))
        
        // O(n²)
        // 1000     - 0.131
        // 2000     - 0.398
        // 10_000    - 8.918
        
    }
    
}
