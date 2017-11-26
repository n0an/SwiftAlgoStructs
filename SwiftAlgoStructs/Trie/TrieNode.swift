//
//  TrieNode.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 24/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

public class TrieNode {
    
    var key: String?
    var children: Array<TrieNode>
    var isFinal: Bool
    var level: Int
    
    
    init() {
        self.children = Array<TrieNode>()
        self.isFinal = false
        self.level = 0
    }
    
    
}
