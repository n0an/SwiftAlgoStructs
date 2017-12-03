//
//  QueueTest.swift
//  SwiftAlgoStructsTests
//
//  Created by Anton Novoselov on 26/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation
import XCTest

@testable import SwiftAlgoStructs

class QueueTest: XCTestCase {
    
    var numberList: Array<Int>!
    
    override func setUp() {
        super.setUp()
        numberList = [8, 2, 10, 9, 7, 5]
    }
    
    //test the deQueueing process
    func testDeQueue() {
        
        let q: Queue<Int>! = buildQueue()
        
        XCTAssertNotNil(q, "queue instance not present..")
    }
    
    //MARK: helper methods
    func buildQueue() -> Queue<Int>! {
        
        let newq: Queue<Int>! = Queue<Int>()
        
        XCTAssertTrue(newq.count == 0, "new queue instance not created..")
        
        //build queue
        for s in numberList {
            newq.enqueue(key: s)
            print("count is: \(newq.count)")
        }
        
        //check equality
        if newq.count != numberList.count {
            XCTFail("queue build failed..")
        }
        
        return newq
    }
    
}
