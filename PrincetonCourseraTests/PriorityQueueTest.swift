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
    func testPQDelMax() {

        let queue = UnorderedArrayMaxPQ<String>()

        queue.insert(x: "P")
        queue.insert(x: "Q")
        queue.insert(x: "E")
        
        let result = queue.delMax()
        
        XCTAssertEqual(result, "Q")
    }
}
