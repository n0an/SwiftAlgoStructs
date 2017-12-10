//
//  QueueTest.swift
//  SwiftAlgoStructsTests
//
//  Created by Anton Novoselov on 26/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation
import XCTest

@testable import PrincetonCoursera

class QueueTest: XCTestCase {
    func testQueueEmpty() {
        let queue = Queue<Int>()
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
        XCTAssertEqual(queue.front, nil)
        XCTAssertNil(queue.dequeue())
    }
    
    func testQueueOneElement() {
        let queue = Queue<Int>()
        
        queue.enqueue(item: 123)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 1)
        XCTAssertEqual(queue.front, 123)
        
        let result = queue.dequeue()
        XCTAssertEqual(result, 123)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
        XCTAssertEqual(queue.front, nil)
    }
    
    func testQueuewoElements() {
        let queue = Queue<Int>()
        
        queue.enqueue(item: 123)
        queue.enqueue(item: 456)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 2)
        XCTAssertEqual(queue.front, 123)
        
        let result1 = queue.dequeue()
        XCTAssertEqual(result1, 123)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 1)
        XCTAssertEqual(queue.front, 456)
        
        let result2 = queue.dequeue()
        XCTAssertEqual(result2, 456)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
        XCTAssertEqual(queue.front, nil)
    }
    
    func testQueueMakeEmpty() {
        let queue = Queue<Int>()
        
        queue.enqueue(item: 123)
        queue.enqueue(item: 456)
        XCTAssertNotNil(queue.dequeue())
        XCTAssertNotNil(queue.dequeue())
        XCTAssertNil(queue.dequeue())
        
        queue.enqueue(item: 789)
        XCTAssertEqual(queue.count, 1)
        XCTAssertEqual(queue.front, 789)
        
        let result = queue.dequeue()
        XCTAssertEqual(result, 789)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
        XCTAssertEqual(queue.front, nil)
    }
    
    func testQueueIterator() {
        let queue = Queue<String>()
        
        queue.enqueue(item: "S")
        queue.enqueue(item: "E")
        queue.enqueue(item: "A")
        queue.enqueue(item: "R")
        queue.enqueue(item: "C")
        queue.enqueue(item: "H")
        queue.enqueue(item: "E")
        queue.enqueue(item: "X")
        queue.enqueue(item: "A")
        queue.enqueue(item: "M")
        queue.enqueue(item: "P")
        queue.enqueue(item: "L")
        queue.enqueue(item: "E")

        for elem in queue {
            print(elem)
        }
    }
}

