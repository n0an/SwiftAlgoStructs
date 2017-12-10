//
//  BSTTest.swift
//  PrincetonCourseraTests
//
//  Created by Anton Novoselov on 10/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation
import XCTest

@testable import PrincetonCoursera

class BSTTest: XCTestCase {
    
    var bst = BST<String, Int>()
    
    override func setUp() {
        super.setUp()
        
        bst = BST<String, Int>()
        
        bst.put(key: "S", val: 0)
        bst.put(key: "E", val: 1)
        bst.put(key: "A", val: 2)
        bst.put(key: "R", val: 3)
        bst.put(key: "C", val: 4)
        bst.put(key: "H", val: 5)
        bst.put(key: "X", val: 6)
    }
    
    func testBSTCreate1() {
        let bst = BST<String, Int>()
        
        bst.put(key: "S", val: 0)
        bst.put(key: "E", val: 1)
        bst.put(key: "A", val: 2)
        bst.put(key: "R", val: 3)
        bst.put(key: "C", val: 4)
        bst.put(key: "H", val: 5)
        bst.put(key: "E", val: 6)
        bst.put(key: "X", val: 7)
        bst.put(key: "A", val: 8)
        bst.put(key: "M", val: 9)
        bst.put(key: "P", val: 10)
        bst.put(key: "L", val: 11)
        bst.put(key: "E", val: 12)
        
        print("root = \(bst.root.key, bst.root.val)")
        bst.printOut(bst.root)
        
        XCTAssertEqual(bst.root.left?.left?.right?.key, "C")
    }
    
    func testBSTCreate2() {
        let bst = BST<String, Int>()
        
        bst.put(key: "A", val: 0)
        bst.put(key: "C", val: 1)
        bst.put(key: "E", val: 2)
        bst.put(key: "H", val: 3)
        bst.put(key: "R", val: 4)
        bst.put(key: "S", val: 5)
        bst.put(key: "X", val: 6)
        
        print("root = \(bst.root.key, bst.root.val)")
        bst.printOut(bst.root)

        XCTAssertNil(bst.root.left)
    }
    
    func testBSTCreate3() {
        
        print("root = \(bst.root.key, bst.root.val)")
        bst.printOut(bst.root)

        XCTAssertEqual(bst.root.left?.left?.right?.key, "C")
    }
    
    func testBSTGet() {
        XCTAssertTrue(bst.get(key: "A") == 2)
    }
    
    func testBSTIterator() {
        
        let iterator2 = bst.getIterator()
        
        for elem in iterator2 {
            print(elem)
        }
    }
}

