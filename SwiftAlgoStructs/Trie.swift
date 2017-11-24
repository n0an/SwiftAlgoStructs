//
//  Trie.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 24/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

public class Trie {
    
    private var root = TrieNode()
    
    //find subscript shortcut
    subscript(word: String) -> Array<String>? {
        get {
            return find(keyword: word)
        }
    }
    
    // builds a tree hierarchy of dictionary content
    func append(keyword: String) {
        
        // trivial case
        guard keyword.length > 0 else {
            return
        }
        
        var current: TrieNode = root
        
        while keyword.length != current.level {
            var childToUse: TrieNode!
            let searchKey = keyword.substring(to: current.level + 1)
            
            // iterate through child nodes
            for child in current.children {
                if child.key == searchKey {
                    childToUse = child
                    break
                }
            }
            
            // new node
            if childToUse == nil {
                childToUse = TrieNode()
                childToUse.key = searchKey
                childToUse.level = current.level + 1
                current.children.append(childToUse)
            }
            
            current = childToUse
        }
        
        if keyword.length == current.level {
            current.isFinal = true
            print("End of word reached!")
            return
        }
        
    }
    
    func find(keyword: String) -> Array<String>? {
        
        // trivial case
        guard keyword.length > 0 else {
            return nil
        }
        
        var current: TrieNode = root
        var wordList = Array<String>()
        
        while keyword.length != current.level {
            
            var childToUse: TrieNode!
            let searchKey = keyword.substring(to: current.level + 1)
            
            // iterate through any child nodes
            for child in current.children {
                
                if child.key == searchKey {
                    childToUse = child
                    current = childToUse
                    break
                }
            }
            
            if childToUse == nil {
                return nil
            }
            
        }
        
        // retrieve the keyword and any descendants
        if current.key == keyword && current.isFinal {
            if let key = current.key {
                wordList.append(key)
            }
        }
        
        // include only children that are words
        for child in current.children {
            if child.isFinal {
                if let key = child.key {
                    wordList.append(key)
                }
            }
        }
        
        return wordList
    }
}

extension String {
    
    var length: Int {
        return self.count
    }
    
    func substring(to: Int) -> String {
        
        let range = self.index(self.startIndex, offsetBy: to)
        
        return String(self[..<range])
        
    }
    
}











