//
//  HashTable.swift
//  SwiftAlgoStructs
//
//  Created by nag on 30/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

enum Result {
    case success
    case collision
    case notFound
    case notSupported
    case fail
}

class HashTable<T: Keyable> {
    
    private var buckets: Array<HashNode<T>?>
    
    init(capacity: Int) {
        self.buckets = Array<HashNode<T>?>(repeatElement(nil, count: capacity))
    }
    
    func append(element: T) -> Result {
        
        let result: Result
        
        // compute hash
        let hashIndex = element.hashIndex(for: element.keystring, using: buckets)
        
        if hashIndex != -1 {
            let childToUse = HashNode<T>()
            childToUse.key = element
            
            // check existing list
            if buckets[hashIndex] == nil {
                buckets[hashIndex] = childToUse
                
                result = .success
                
            } else {
                print("collision occurred. implementing chaining..")
                // table separate chaining process
                var head = buckets[hashIndex]
                
                // append item
                childToUse.next = head
                head = childToUse
                
                // update chained list
                buckets[hashIndex] = head
                
                result = .collision
            }
            
        } else {
            result = .fail
        }
        
        return result
    }
    
    // test for containing element
    func contains<T: Keyable>(element: T) -> Bool {
        
        // obtain hash index
        let hashIndex = element.hashIndex(for: element.keystring, using: buckets)
        
        guard hashIndex != -1 else {
            return false
        }
        
        if buckets[hashIndex] != nil {
            
            var current = buckets[hashIndex]
            
            // check chained list for match
            while current != nil {
                if let item = current?.key {
                    if item.keystring == element.keystring {
                        return true
                    }
                }
                
                current = current?.next
            }
        }
        
        return false
    }
}


