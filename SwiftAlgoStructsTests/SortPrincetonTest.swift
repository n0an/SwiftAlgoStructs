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
    
    //test input types for algorithms
    var numberList = [8, 2, 10, 9, 7, 5]
    var searchList = [0,4,7,9,13,16,34]
    
    var trivialNumberList = [1]
    
    var emptyNumberList: Array<Int> = []
    
    var textList = ["Dog", "Cat", "Dinasour", "Lion", "Cheetah", "Gazelle", "Elephant", "Aardvark"]
    
    var triviaTextList = ["Dog"]
    var emptyTextList: Array<String> = []
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testQuickSort() {
        
        let arr = Array(1...1000)
        
        let shuffledArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arr) as! [Int]
        
        let start = Date()
        
        print("Start to sort")
        
        let sortedArr = Quick.sort(arr: shuffledArray)
        
        print("shuffled")
        
        let timePassed = Date().timeIntervalSince(start)
        
        print("timePassed = \(timePassed)")
        
        XCTAssertTrue(isSorted(sortedArr))
        
    }
    
    func testQuickSortWithDuplicates() {

        let arrWithDuplicates = Array<Int>(repeating: 100, count: 2)
        let arrNonDuplicates = Array(101...200)
        
        let arr = arrWithDuplicates + arrNonDuplicates
//        let arr = arrWithDuplicates
//        let arr = arrNonDuplicates

        let shuffledArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arr) as! [Int]
        
        let start = Date()
        
        print("Start to sort")
        
        let sortedArr = Quick.sort(arr: shuffledArray)
        
        print("shuffled")
        
        let timePassed = Date().timeIntervalSince(start)
        
        print("timePassed = \(timePassed)")
        
        XCTAssertTrue(isSorted(sortedArr))
    }
    
    func testQuickSortAlreadySortedArray() {
        let arr = Array(1...100000)
        
        let start = Date()
        
        print("Start to sort")
        
        let sortedArr = Quick.sort(arr: arr)
        
        print("shuffled")
        
        let timePassed = Date().timeIntervalSince(start)
        
        print("timePassed = \(timePassed)")
        
        XCTAssertTrue(isSorted(sortedArr))
    }
    
}
