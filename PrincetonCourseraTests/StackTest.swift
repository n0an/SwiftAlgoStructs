//
//  StackTest.swift
//  SwiftAlgoStructsTests
//
//  Created by Anton Novoselov on 26/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation
import XCTest

@testable import PrincetonCoursera

class StackTest: XCTestCase {
    
    func testLLStackEmpty() {
        let linkedListStack = StackLinkedList<Int>()
        XCTAssertTrue(linkedListStack.isEmpty())
        XCTAssertEqual(linkedListStack.count, 0)
        XCTAssertNil(linkedListStack.pop())
    }
    
    func testOneElementLLStack() {
        let stack = StackLinkedList<Int>()
        
        stack.push(item: 123)
        XCTAssertFalse(stack.isEmpty())
        XCTAssertEqual(stack.count, 1)
        
        let result = stack.pop()
        XCTAssertEqual(result, 123)
        XCTAssertTrue(stack.isEmpty())
        XCTAssertEqual(stack.count, 0)
        XCTAssertNil(stack.pop())
    }
    
    func testTwoElementsLLStack() {
        let stack = StackLinkedList<Int>()
        
        stack.push(item: 123)
        stack.push(item: 456)
        XCTAssertFalse(stack.isEmpty())
        XCTAssertEqual(stack.count, 2)
        
        let result1 = stack.pop()
        XCTAssertEqual(result1, 456)
        XCTAssertFalse(stack.isEmpty())
        XCTAssertEqual(stack.count, 1)
        
        let result2 = stack.pop()
        XCTAssertEqual(result2, 123)
        XCTAssertTrue(stack.isEmpty())
        XCTAssertEqual(stack.count, 0)
        XCTAssertNil(stack.pop())
    }
    
    func testMakeEmptyLLStack() {
        let stack = StackLinkedList<Int>()
        
        stack.push(item: 123)
        stack.push(item: 456)
        XCTAssertNotNil(stack.pop())
        XCTAssertNotNil(stack.pop())
        XCTAssertNil(stack.pop())
        
        stack.push(item: 789)
        XCTAssertEqual(stack.count, 1)
        
        let result = stack.pop()
        XCTAssertEqual(result, 789)
        XCTAssertTrue(stack.isEmpty())
        XCTAssertEqual(stack.count, 0)
        XCTAssertNil(stack.pop())
    }
    
}
