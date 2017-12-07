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
    
    let duplicatesRatio = 0.9
    
    let quickSortTypeToTest = QuickSortType.type3WayDutch
    
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
    
    func sortWithDuplicates(arraySize: ArraySize) -> TimeInterval {
        
        let arrWithDuplicates = Array<Int>(repeating: 100, count: Int(Double(arraySize.rawValue) * duplicatesRatio))
        
        var arrNonDuplicates = [Int]()
        if duplicatesRatio != 1.0 {
            arrNonDuplicates = Array(101...100 + arraySize.rawValue - arrWithDuplicates.count)
        }
        
        let arr = arrWithDuplicates + arrNonDuplicates
        
        let shuffledArrayToSort = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arr) as! [Int]
        
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
    
    func sortAlreadySorted(arraySize: ArraySize) -> TimeInterval {
        
        let arr = Array(1...arraySize.rawValue)
     
        let start = Date()
        
        var sortedArr: [Int] = []
        
        switch quickSortTypeToTest {
        case .typePartitionHoare:
            sortedArr = Quick.sort(arr: arr)
        case .type3WayDutch:
            sortedArr = Quick.sort3Way(arr: arr)
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
        
        print("k10/k1 = \(Int(timePassedK10/timePassedK1)), k100/k10 = \(Int(timePassedK100/timePassedK10)),")

    }
    
    // O(n log n)
    func testQuickSortWithDuplicates() {
        
        let timePassedK1 = sortWithDuplicates(arraySize: .k1)
        print("timePassedK1 = \(timePassedK1)")
        
        let timePassedK10 = sortWithDuplicates(arraySize: .k10)
        print("timePassedK10 = \(timePassedK10)")
        
        let timePassedK100 = sortWithDuplicates(arraySize: .k100)
        print("timePassedK100 = \(timePassedK100)")
        
        print("k10/k1 = \(Int(timePassedK10/timePassedK1)), k100/k10 = \(Int(timePassedK100/timePassedK10)),")
    }
    
    func testQuickSortAlreadySortedArray() {
        
        let timePassedK1 = sortAlreadySorted(arraySize: .k1)
        print("timePassedK1 = \(timePassedK1)")
        
        let timePassedK10 = sortAlreadySorted(arraySize: .k10)
        print("timePassedK10 = \(timePassedK10)")
        
        let timePassedK100 = sortAlreadySorted(arraySize: .k100)
        print("timePassedK100 = \(timePassedK100)")
        
        print("k10/k1 = \(Int(timePassedK10/timePassedK1)), k100/k10 = \(Int(timePassedK100/timePassedK10)),")
    }
    
}
