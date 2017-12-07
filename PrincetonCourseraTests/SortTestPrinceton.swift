//
//  SortTestPrinceton.swift
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

class SortTestPrinceton:XCTestCase, Sortable {
    
    let duplicatesRatio = 1.0
    
    let quickSortTypeToTest = QuickSortType.type3WayDutch
    
    override func setUp() {
        super.setUp()
        
    }
    
    func sort(arraySize: ArraySize) -> TimeInterval {
        
        let arrayToSort = Array(1...arraySize.rawValue)
        
        let shuffledArrayToSort = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arrayToSort) as! [Int]
        
        let start = Date()
        
        var sortedArr: [Int] = []
        
        switch quickSortTypeToTest {
        case .typePartitionHoare:
            sortedArr = Quick.sort(arr: shuffledArrayToSort)
        case .type3WayDutch:
            sortedArr = Quick.sort3Way(arr: shuffledArrayToSort)
        }
        
        let timePassed = Date().timeIntervalSince(start)
        
        XCTAssertTrue(isSorted(sortedArr))
        
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
    }
    
    func testQuickSortWithDuplicates() {
        
        let arraySize = ArraySize.k1.rawValue
        
        let arrWithDuplicates = Array<Int>(repeating: 100, count: Int(Double(arraySize) * duplicatesRatio))
        
        var arrNonDuplicates = [Int]()
        if duplicatesRatio != 1.0 {
            arrNonDuplicates = Array(101...100 + arraySize - arrWithDuplicates.count)
        }
        
        let arr = arrWithDuplicates + arrNonDuplicates
        
        let shuffledArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arr) as! [Int]
        
        let start = Date()
        
        print("Start to sort")
        
        let sortedArr = Quick.sort(arr: shuffledArray)
        
        print("shuffled")
        
        let timePassed = Date().timeIntervalSince(start)
        
        print("timePassed = \(timePassed)")
        
        XCTAssertTrue(isSorted(sortedArr))
        
        // O(n log n)
        // 1000     - 0.008
        // 10_000    - 0.09
        // 100_000   - 0.754
        // 1_000_000  - 8.784
    }
    
    func testQuickSortAlreadySortedArray() {
        let arr = Array(1...ArraySize.k1.rawValue)
        
        let start = Date()
        
        print("Start to sort")
        
        let sortedArr = Quick.sort(arr: arr)
        
        print("shuffled")
        
        let timePassed = Date().timeIntervalSince(start)
        
        print("timePassed = \(timePassed)")
        
        XCTAssertTrue(isSorted(sortedArr))
        
        // O(n²)
        // 1000     - 0.116
        // 10_000    - 8.549
        // 20_000    - 33.911
        
    }
    
}
