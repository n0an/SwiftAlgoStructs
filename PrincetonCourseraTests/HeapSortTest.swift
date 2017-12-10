//
//  HeapSortTest.swift
//  PrincetonCourseraTests
//
//  Created by Anton Novoselov on 10/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation
import XCTest

@testable import PrincetonCoursera

class HeapSortTest: XCTestCase {
    
    // === HEAP SORT ===
    func testHeapSort() {
        print("--- testHeapSort ---")
        
        var arr: [String?] = "SORTEXAMPLE".map { String($0) }
        
        Heap.sort(a: &arr)
        
        print(Heap.showArray(&arr))
        
        XCTAssertEqual(Heap.showArray(&arr), "AEELMOPRSTX")
    }
}
