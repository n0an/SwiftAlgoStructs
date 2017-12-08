//
//  SortTest.swift
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

class SortTest:XCTestCase, Sortable {
    
    let duplicatesRatio = 0.9
    
    let quickSortTypeToTest = QuickSortType.type3WayDutch
    
    // === QUICK SORT ===

    // O(n log n)
    func testQuickSort() {
        print("--- testQuickSort ---")

        let timePassedK1 = sort(arraySize: .k1)
        print("timePassedK1 = \(timePassedK1)")

        let timePassedK10 = sort(arraySize: .k10)
        print("timePassedK10 = \(timePassedK10)")
        
        let timePassedK100 = sort(arraySize: .k100)
        print("timePassedK100 = \(timePassedK100)")
        
        let grade1 = String(format: "%.02f", Float(timePassedK10/timePassedK1))
        let grade2 = String(format: "%.02f", Float(timePassedK100/timePassedK10))
        
        print("k10/k1 = \(grade1), k100/k10 = \(grade2)")

    }
    
    // O(n log n)
    func testQuickSortWithDuplicates() {
        print("--- testQuickSortWithDuplicates ---")
        
        let timePassedK1 = sortWithDuplicates(arraySize: .k1)
        print("timePassedK1 = \(timePassedK1)")
        
        let timePassedK10 = sortWithDuplicates(arraySize: .k10)
        print("timePassedK10 = \(timePassedK10)")
        
        let timePassedK100 = sortWithDuplicates(arraySize: .k100)
        print("timePassedK100 = \(timePassedK100)")
        
        let grade1 = String(format: "%.02f", Float(timePassedK10/timePassedK1))
        let grade2 = String(format: "%.02f", Float(timePassedK100/timePassedK10))
        
        print("k10/k1 = \(grade1), k100/k10 = \(grade2)")
    }
    
    func testQuickSortAlreadySortedArray() {
        print("--- testQuickSortAlreadySortedArray ---")

        let timePassedK1 = sortAlreadySorted(arraySize: .k1)
        print("timePassedK1 = \(timePassedK1)")
        
        let timePassedK2 = sortAlreadySorted(arraySize: .k2)
        print("timePassedK2 = \(timePassedK2)")
        
        let timePassedK4 = sortAlreadySorted(arraySize: .k4)
        print("timePassedK4 = \(timePassedK4)")
        
        let grade1 = String(format: "%.02f", Float(timePassedK2/timePassedK1))
        let grade2 = String(format: "%.02f", Float(timePassedK4/timePassedK2))

        print("k2/k1 = \(grade1), k4/k2 = \(grade2)")
    }
    
    // === HEAP SORT ===
    func testHeapSort() {
        print("--- testHeapSort ---")

        var arr: [String?] = "SORTEXAMPLE".map { String($0) }
        
        Heap.sort(a: &arr)
        
        print(Heap.showArray(&arr))
        
        XCTAssertEqual(Heap.showArray(&arr), "AEELMOPRSTX")
        
    }
    
    // MARK: - HELPER METHODS FOR QUICKSORT
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
    
}
