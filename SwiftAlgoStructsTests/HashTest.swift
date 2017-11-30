//
//  HashTest.swift
//  SwiftAlgoStructsTests
//
//  Created by nag on 30/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import XCTest

@testable import SwiftAlgoStructs

class HashTest: XCTestCase {
  
    //test strings
    func testStringList() {
        
        /*
         note: each element has its own potential 'slot' in the
         hash list. In this scenario, the hash table algorithm will
         implement 'separate chaining' to support 'hash collisions'.
         */
        
        //new string list
        let slist = HashTable<String>(capacity: 3)
        
        _ = slist.append(element: "Wayne Bishop")
        _ = slist.append(element: "Frank Smith")
        _ = slist.append(element: "Jennifer Hobbs")
        _ = slist.append(element: "Tim Cook")
        _ = slist.append(element: "Steve Jobs")
        _ = slist.append(element: "Wayne Bishop") //should produce collision
        _ = slist.append(element: "Larry Page")
        _ = slist.append(element: "Albert Einstien")
        
        //test list compliance
        XCTAssertTrue(slist.contains(element: "Frank Smith"), "hash table element not found..")
    }
    
    //test verticies - custom
    func testVertexList() {
        
        let testVertex: Vertex = Vertex()
        testVertex.key = "A"
        
        let vList: HashTable = HashTable<Vertex>(capacity: 10)
        _ = vList.append(element: testVertex)
        
        //test list compliance
        XCTAssertTrue(vList.contains(element: "A"), "hash table element not found..")
    }
    
    //test floats
    func testMissingList() {
        
        //new float list
        let fList = HashTable<Double>(capacity: 5)
        
        _ = fList.append(element: 10.2)
        _ = fList.append(element: 8.6)
        
        //element doesn't exist
        XCTAssertFalse(fList.contains(element: 3.7), "hash table element not found..")
    }
}
