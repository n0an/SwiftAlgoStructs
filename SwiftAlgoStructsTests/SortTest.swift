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

class SortTest:XCTestCase {
    
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
        
        // *** Without diplicates
        let arr = Array(1...10000)
        
        let shuffledArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arr)
        
//        let shuffledArray = arr
        
        let start = Date()
        
        print("Start to sort")
        
        quickSort(array: shuffledArray as! [Int])
        print("shuffled")
        
        let timePassed = Date().timeIntervalSince(start)
        
        print("timePassed = \(timePassed)")
        
        // *** With duplicates
        //        let arrWithDuplicates = Array<Int>(repeating: 100, count: 900)
        //        let arrNonDuplicates = Array(101...200)
        //
        //        let arr = arrWithDuplicates + arrNonDuplicates
        //
        //        let shuffledArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arr)
        //
        //        let start = Date()
        //
        //        print("Start to sort")
        //
        //
        //        quickSort(array: shuffledArray as! [Int])
        //        print("shuffled")
        //
        //        let timePassed = Date().timeIntervalSince(start)
        //
        //        print("timePassed = \(timePassed)")
    }
    
}
