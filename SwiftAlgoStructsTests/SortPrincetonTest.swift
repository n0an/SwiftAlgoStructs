//
//  SortPrincetonTest.swift
//  SwiftAlgoStructsTests
//
//  Created by Anton Novoselov on 01/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

import Foundation
import XCTest
import GameKit

@testable import PrincetonCoursera

class SortPrincetonTest:XCTestCase, Sortable {
    
    let duplicatesRatio = 0.999
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testQuickSort() {
        
        let arrayToSort = Array(1...ArraySize.k1.rawValue)
        
        let shuffledArrayToSort = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arrayToSort) as! [Int]
        
        let start = Date()
        
        print("Start to sort")
        
        let sortedArr = Quick.sort(arr: shuffledArrayToSort)
        
        print("shuffled")
        
        let timePassed = Date().timeIntervalSince(start)
        
        print("timePassed = \(timePassed)")
        
        XCTAssertTrue(isSorted(sortedArr))
        
        // O(n log n)
        // 1000     - 0.006
        // 10000    - 0.006
        // 100000   - 0.617
        // 1000000  - 7.23
        
    }
    
    func testQuickSortWithDuplicates() {

        let arraySize = ArraySize.k10.rawValue
        
        let arrWithDuplicates = Array<Int>(repeating: 100, count: Int(Double(arraySize) * duplicatesRatio))
        let arrNonDuplicates = Array(101...100 + arraySize - arrWithDuplicates.count)
        
        let arr = arrWithDuplicates + arrNonDuplicates

        let shuffledArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arr) as! [Int]
        
        let start = Date()
        
        print("Start to sort")
        
        let sortedArr = Quick.sort(arr: shuffledArray)
        
        print("shuffled")
        
        let timePassed = Date().timeIntervalSince(start)
        
        print("timePassed = \(timePassed)")
        
        XCTAssertTrue(isSorted(sortedArr))
        
        // O(n log n) ?? should be quadratic ?
        // 1000     - 0.008
        // 10000    - 0.09
        // 100000   - 0.754
        // 1000000  - 8.784
    }
    
    func testQuickSortAlreadySortedArray() {
        let arr = Array(1...ArraySize.k10.rawValue)

        let start = Date()
        
        print("Start to sort")
        
        let sortedArr = Quick.sort(arr: arr)
        
        print("shuffled")
        
        let timePassed = Date().timeIntervalSince(start)
        
        print("timePassed = \(timePassed)")
        
        XCTAssertTrue(isSorted(sortedArr))
        
        // O(n²)
        // 1000     - 0.116
        // 10000    - 8.549
        // 20000    - 33.911
        
    }
    
}
