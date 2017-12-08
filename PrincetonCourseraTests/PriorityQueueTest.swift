//
//  PriorityQueueTest.swift
//  PrincetonCourseraTests
//
//  Created by Anton Novoselov on 08/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation
import XCTest

@testable import PrincetonCoursera

class PriorityQueueTest: XCTestCase {
    func testUnorderedMaxPQDelMax() {

        let queue = UnorderedArrayMaxPQ<String>()

        queue.insert(x: "P")
        queue.insert(x: "Q")
        queue.insert(x: "E")
        
        let result = queue.delMax()
        
        XCTAssertEqual(result, "Q")
    }
    
    // Binary Heap using MaxPG
    func testHeapDelMax() {
        
        let queue = MaxPQ<String>()
        
        queue.insert(x: "T")
        queue.insert(x: "S")
        queue.insert(x: "R")
        queue.insert(x: "N")
        queue.insert(x: "P")
        queue.insert(x: "O")
        queue.insert(x: "A")
        queue.insert(x: "E")
        queue.insert(x: "I")
        queue.insert(x: "G")
        queue.insert(x: "H")
        
        print(queue.pqArray)
        
        let result = queue.delMax()
        
        print(queue.pqArray)

        XCTAssertEqual(result, "T")
    }
}
