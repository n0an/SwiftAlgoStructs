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
    
    let quickSortTypeToTest = QuickSortType.type3WayDutch
    
    func sort(arraySize: ArraySize) -> TimeInterval {
        
        let arrayToSort = Array(1...arraySize.rawValue)
        
        var shuffledArrayToSort = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arrayToSort) as! [Int]
        
        let start = Date()
        
        switch quickSortTypeToTest {
        case .typePartitionHoare:
            quicksortHoare(&shuffledArrayToSort, low: 0, high: shuffledArrayToSort.count - 1)
        case .type3WayDutch:
            quicksortDutchFlag(&shuffledArrayToSort, low: 0, high: shuffledArrayToSort.count - 1)
        }
        
        let timePassed = Date().timeIntervalSince(start)
        
        XCTAssertTrue(isSorted(shuffledArrayToSort))
        
        return timePassed
    }
    
    // O(n log n)
    func testQuickSort() {
        
        let timePassedK1 = sort(arraySize: .k1)
        print("timePassedK1 = \(timePassedK1)")
        
        let timePassedK10 = sort(arraySize: .k10)
        print("timePassedK10 = \(timePassedK10)")
        
        let timePassedK100 = sort(arraySize: .k100)
        print("timePassedK100 = \(timePassedK100)")
        
        print("k10/k1 = \(Int(timePassedK10/timePassedK1)), k100/k10 = \(Int(timePassedK100/timePassedK10)),")
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
