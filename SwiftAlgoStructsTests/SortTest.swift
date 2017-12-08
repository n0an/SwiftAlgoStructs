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
    
    let duplicatesRatio = 0.9
    
    let quickSortTypeToTest = QuickSortType.typePartitionHoare
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testQuickSortDifferentTypesArrays() {
        print("--- testQuickSortDifferentTypesArrays ---")
        XCTAssertTrue(isSorted(numberList.quickSort()))
        XCTAssertTrue(isSorted(trivialNumberList.quickSort()))
        XCTAssertTrue(isSorted(emptyNumberList.quickSort()))
        XCTAssertTrue(isSorted(textList.quickSort()))
        XCTAssertTrue(isSorted(triviaTextList.quickSort()))
        XCTAssertTrue(isSorted(emptyTextList.quickSort()))
    }
    
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
    
    
    // MARK: - HELPER METHODS
    func sort(arraySize: ArraySize) -> TimeInterval {
        
        let arrayToSort = Array(1...arraySize.rawValue)
        
        var shuffledArrayToSort = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arrayToSort) as! [Int]
        
        let start = Date()
        
        var sortedArr: [Int] = []
        
        switch quickSortTypeToTest {
        case .typePartitionHoare:
            sortedArr = shuffledArrayToSort.quickSort()
        case .type3WayDutch:
            break
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
        
        var shuffledArrayToSort = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arr) as! [Int]
        
        let start = Date()
        
        var sortedArr: [Int] = []
        
        switch quickSortTypeToTest {
        case .typePartitionHoare:
            sortedArr = shuffledArrayToSort.quickSort()
        case .type3WayDutch:
            break
        }
        
        let timePassed = Date().timeIntervalSince(start)
        
        XCTAssertTrue(isSorted(sortedArr))
        
        return timePassed
    }
    
    func sortAlreadySorted(arraySize: ArraySize) -> TimeInterval {
        
        var arr = Array(1...arraySize.rawValue)
        
        let start = Date()
        
        var sortedArr: [Int] = []
        
        switch quickSortTypeToTest {
        case .typePartitionHoare:
            sortedArr = arr.quickSort()
        case .type3WayDutch:
            break
        }
        
        let timePassed = Date().timeIntervalSince(start)
        
        XCTAssertTrue(isSorted(sortedArr))
        
        return timePassed
    }
    
}
