//
//  Stack.swift
//  SwiftAlgoStructsTests
//
//  Created by Anton Novoselov on 24/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation


public class StackLinkedList<T: Equatable> {
    
    private var first = LLNode<T>()

    public func isEmpty() -> Bool {
        return first == nil
    }
    
    public func push(item: T) {
        let oldFirst = first
        first = LLNode<T>()
        first.key = item
        first.next = oldFirst
    }
    
    
    func pop() -> T? {
        let item = first.key
        if let next = first.next {
            first = next
        }
        
        return item
    }
    
}


