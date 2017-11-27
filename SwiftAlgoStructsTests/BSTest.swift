//
//  BSTest.swift
//  SwiftAlgoStructsTests
//
//  Created by Anton Novoselov on 27/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import XCTest

@testable import SwiftAlgoStructs

// *** Bishop + Bishop Tests

class BSTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testCount() {
        
        let numberList = [1, 2, 3, 5, 234, -20]
        let bsTree = BSTree<Int>()
        
        for number in numberList {
            bsTree.append(key: number)
        }
        
        bsTree.root.traverse()
        
        XCTAssert(bsTree.root.count == numberList.count, "Expected tree's size to be \(numberList.count), got \(bsTree.root.count) instead.")
    }
    
    // single right rotation - O(n)
    func testEssayExample() {
        
        let numberList : Array<Int> = [29, 26, 23]
        
        // build and balance model
        let _: Void = buildBSTree(numberList)
    }
    
    // input for a balanced avl tree - O(log n)
    func testBalancedTree() {
        
        let numberList : Array<Int> = [8, 5, 10, 3, 12, 9, 6, 16]
        
        // build and balance model
        let _: Void = buildBSTree(numberList)
    }
    
    // input for multiple right rotations - O(n)
    func testRotationRight() {
        
        let numberList: Array<Int> = [29, 26, 23, 20, 19]
        
        // build and balance model
        let _: Void = buildBSTree(numberList)
    }
    
    // input for multiple left rotations - O(n)
    func testRotationLeft() {
        
        let numberList: Array<Int> = [19, 20, 23, 26, 29]
        
        // build and balance model
        let _: Void = buildBSTree(numberList)
        
    }
    
    // input for left and right rotations - 0(n)
    func testRotationLeftAndRight() {
        
        let numberList: Array<Int> = [19, 20, 21, 26, 16, 12]
        
        // build and balance model
        let _: Void = buildBSTree(numberList)
    }
    
    // MARK: - SEARCH TREES
    func testContainsRoot() {
        
        let sequence: Array<Int> = [8, 2, 1, 3]
        let testvalue: Int = sequence[1]
        
        // build and balance model
        let bsTest: BSTree<Int> = buildBSTree(sequence)
        
        if bsTest.contains(key: testvalue) == false {
            XCTFail("contains bst test fails for value: \(testvalue)..")
        }
    }
    
    func testContainsLeft() {
        
        let sequence: Array<Int> = [8, 2, 1, 3]
        let testvalue: Int = sequence[2]
        
        // build and balance model
        let bsTest: BSTree<Int> = buildBSTree(sequence)
        
        if bsTest.contains(key: testvalue) == false {
            XCTFail("contains bst test fails for value: \(testvalue)..")
        }
    }
    
    func testContainsRight() {
        
        let sequence: Array<Int> = [8, 2, 1, 3]
        let testvalue: Int = sequence[3]
        
        // build and balance model
        let bsTest: BSTree<Int> = buildBSTree(sequence)
        
        if bsTest.contains(key: testvalue) == false {
            XCTFail("contains bst test fails for value: \(testvalue)..")
        }
    }
    
    func testContainsNoValue() {
        
        let sequence: Array<Int> = [8, 2, 1, 3]
        
        /* note - value not contained in set..*/
        let testvalue: Int = 32
        
        // build and balance model
        let bsTest: BSTree<Int> = buildBSTree(sequence)
        
        if bsTest.contains(key: testvalue) == true {
            XCTFail("contains bst test fails for value: \(testvalue)..")
        }
    }
    
    //MARK: - CLOSURE TESTS
    
    // update tree values with function
    func testTraverseFunction() {
        
        let bsTest = self.buildClosureTree()
        
        // invoke formula function
        bsTest.root.traverse(withFormula: traverseFormula)
    }
    
    // update BST values with closure expression
    func testTraverseExpression() {
        
        let bsTree = self.buildClosureTree()
        var didFail: Bool = false
        
        /*
         notes: for this test, the didFail variable is known to be 'captured' by the closure expression.
         this technique allows a single variable to be used.
         */
        
        bsTree.root.traverse { (node: BSNode<Int>) -> Int in
            
            let results = node.key! + node.height
            if node.height > 0 && node.key! == results {
                didFail = true
            }
            
            return results
        }
        
        XCTAssertFalse(didFail, "..closure update failed..")
    }
    
    // update avl values with closure function
    func traverseFormula(node: BSNode<Int>) -> Int {
        
        let results = node.key! + node.height
        if node.height > 0 && node.key! == results {
            XCTFail("closure update failed..")
        }
        
        return results
    }
    
    //MARK: - HELPER METHODS
    
    // build and balance BST
    func buildBSTree(_ sequence: Array<Int>) -> () {
        
        // test for new instance
        let bsTest: BSTree<Int> = BSTree<Int>()
        XCTAssertNotNil(bsTest, "bst instance not created..")
        
        for item in sequence {
            print("adding \(item) to tree...")
            bsTest.append(key: item)
        }
        
        bsTest.root.traverse()
        
        XCTAssertTrue(bsTest.isTreeBalanced(for: bsTest.root), "tree is unbalanced..")
    }
    
    func buildBSTree(_ sequence: Array<Int>) -> BSTree<Int> {
        
        // test for new instance
        let bsTest: BSTree<Int> = BSTree<Int>()
        XCTAssertNotNil(bsTest, "bst instance not created..")
        
        for item in sequence {
            print("adding \(item) to bst tree...")
            bsTest.append(key: item)
        }
        
        bsTest.root.traverse()
        
        XCTAssertTrue(bsTest.isTreeBalanced(for: bsTest.root), "tree is unbalanced..")
        
        return bsTest
    }
    
    // build specific model to be traversed with closures
    func buildClosureTree() -> BSTree<Int> {
        
        let bsTest: BSTree<Int> = BSTree<Int>()
        XCTAssertNotNil(bsTest, "bst instance not created..")
        
        //provide a balanced list
        let numberList : Array<Int> = [8, 5, 10, 3, 12, 9, 6, 16]
        
        for number in numberList {
            print("adding \(number) to avl tree...")
            bsTest.append(key: number)
        }
        
        XCTAssertTrue(bsTest.isTreeBalanced(for: bsTest.root), "tree is unbalanced..")
        
        return bsTest
    }
    
}
