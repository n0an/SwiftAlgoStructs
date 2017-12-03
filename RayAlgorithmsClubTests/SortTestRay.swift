//
//  SortTestRay.swift
//  SwiftAlgoStructsTests
//
//  Created by Anton Novoselov on 02/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

import Foundation
import XCTest
import GameKit

@testable import RayAlgorithmsClub

class SortTestRay:XCTestCase, Sortable {
    
    let duplicatesRatio = 0.9
    
    func testQuickSort() {
        
        let arrayToSort = Array(1...ArraySize.k100.rawValue)
        
        var shuffledArrayToSort = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arrayToSort) as! [Int]
        
        let start = Date()
        
        print("Start to sort")
                
        quicksortHoare(&shuffledArrayToSort, low: 0, high: shuffledArrayToSort.count - 1)

        
        print("shuffled")
        
        let timePassed = Date().timeIntervalSince(start)
        
        print("timePassed = \(timePassed)")
        
        XCTAssertTrue(isSorted(shuffledArrayToSort))
        
        // O(n log n)
        // 1000     - 0.004
        // 10_000   - 0.029
    
    }
    
    func testQuickSortWithDuplicates() {

        let arraySize = ArraySize.k100.rawValue

        let arrWithDuplicates = Array<Int>(repeating: 100, count: Int(Double(arraySize) * duplicatesRatio))

        var arrNonDuplicates = [Int]()
        if duplicatesRatio != 1.0 {
            arrNonDuplicates = Array(101...100 + arraySize - arrWithDuplicates.count)
        }

        let arr = arrWithDuplicates + arrNonDuplicates

        var shuffledArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arr) as! [Int]

        let start = Date()

        print("Start to sort")

        quicksortHoare(&shuffledArray, low: 0, high: shuffledArray.count - 1)

        print("shuffled")

        let timePassed = Date().timeIntervalSince(start)

        print("timePassed = \(timePassed)")

        XCTAssertTrue(isSorted(shuffledArray))

        // O(n log n)
        // 1000     - 0.004
        // 10_000   - 0.043
        // 100_000  - 0.519
    
    }

    func testQuickSortAlreadySortedArray() {
        var arr = Array(1...ArraySize.k10.rawValue)

        let start = Date()

        print("Start to sort")

        quicksortHoare(&arr, low: 0, high: arr.count - 1)

        print("shuffled")

        let timePassed = Date().timeIntervalSince(start)

        print("timePassed = \(timePassed)")

        XCTAssertTrue(isSorted(arr))

        // O(n²)
        // 1000      - 0.071
        // 10_000    - 3.522
        
    }
    
}
