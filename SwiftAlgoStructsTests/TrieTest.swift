//
//  TrieTest.swift
//  SwiftAlgoStructsTests
//
//  Created by Anton Novoselov on 24/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation
import XCTest

@testable import SwiftAlgoStructs

// *** Bishop + Bishop Tests

class TrieTest: XCTestCase {
    
    var testTrie = Trie()
    
    
    override func setUp() {
        super.setUp()
        
        XCTAssertNotNil(testTrie, "Trie instance not correctly intialized..")
        
        //add words to data structure
        testTrie.append(keyword: "Ball")
        testTrie.append(keyword: "Balls")
        testTrie.append(keyword: "Ballard")
        testTrie.append(keyword: "Bat")
        testTrie.append(keyword: "Bar")
    }
    
    
    /*
     the findWord algorithm will only return strings identified as words. For example, the prefix "Ba" has children,
     but only 2 are marked as final. Even though the phrase "Bal" is found in the trie, it is not
     identified as a word.
     */
    
    func testFindWithPrefix() {
        
        guard let list = testTrie["Ba"] else {
            XCTFail("test failed: no words found..")
            return
        }
        
        for word in list {
            print("\(word) found in trie..")
        }
    }
    
    
    //note: the findWord algorthim will identify both parents and children identified as words
    
    func testFindWithWord() {
        
        guard let list = testTrie["Ball"] else {
            XCTFail("test failed: no words found")
            return
        }
        
        for word in list {
            print("\(word) found in trie..")
        }
        
    }
    
    
    //testing false search results
    func testFindNoExist() {
        
        let keyword = "Barstool"
        
        //attempt to find word
        guard let _ = testTrie[keyword] else {
            return
        }
        
        XCTFail("test failed: \(keyword) incorrectly found in trie..")
    }
    
    
}
