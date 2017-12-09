//
//  BSTree.swift
//  PrincetonCoursera
//
//  Created by Anton Novoselov on 09/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

public class BST<Key: Comparable, Value> {
    
    public var root: Node!
    
//    init() {
//        self.root = nil
//    }
    
    private class Node {
        public var key: Key
        public var val: Value
        public var left: Node!
        public var right: Node!
        
        public var count: Int!
        
        init(key: Key, val: Value) {
            self.key = key
            self.val = val
            
        }
        
    }
    
    public func size() -> Int {
        return size(root)
    }
    
    private func size(_ x: Node?) -> Int {
        guard let x = x else { return 0 }
        return x.count
    }
    
    public func put(key: Key, val: Value) {
        root = put(root, key, val)
    }
    
    private func put(_ x: Node?, _ key: Key, _ val: Value) -> Node {
        
        guard let x = x else { return Node(key: key, val: val) }
        
        if key < x.key {
            x.left = put(x.left, key, val)
        } else if key > x.key {
            x.right = put(x.right, key, val)
        } else {
            x.val = val
        }
        
        x.count = 1 + size(x.left) + size(x.right)
        
        return x
    }
    
    public func get(key: Key) -> Value? {
        var x = root
        
        while x != nil {
            if key < (x?.key)! {
                x = x?.left
            } else if key < (x?.key)! {
                x = x?.right
            } else {
                return x!.val
            }
        }
        return nil
    }
    
    public func rank(key: Key) -> Int {
        return rank(key: key, x: root)
    }
    
    private func rank(key: Key, x: Node?) -> Int {
        guard let x = x else { return 0 }
        
        if key < x.key {
            return rank(key: key, x: x.left)
        } else if key > x.key {
            return 1 + size(x.left) + rank(key: key, x: x.right)
        } else {
            return size(x.left)
        }
        
    }
    
    public func floor(key: Key) -> Key? {
        guard let x = floor(root, key) else { return nil }
        
        return x.key
    }
    
    private func floor(_ x: Node?, _ key: Key) -> Node? {
        
        guard let x = x else { return nil }
        if key == x.key {
            return x
        } else if key < x.key {
            return floor(x.left, key)
        }
        
        let t = floor(x.right, key)
        
        if t != nil {
            return t
        } else {
            return x
        }
    }
    
    public func deleteMin() {
        root = deleteMin(root)
    }
    
    private func deleteMin(_ x: Node) -> Node {
        if x.left == nil {
            return x.right
        }
        
        x.left = deleteMin(x.left)
        x.count = 1 + size(x.left) + size(x.right)
        
        return x
    }
    
    public func delete(key: Key) {
        root = delete(root, key)
    }
    
    private func delete(_ x: Node?, _ key: Key) -> Node? {
        guard let x = x else { return nil }
        
        if key < x.key {  // search for key
            x.left = delete(x.left, key)
        } else if key > x.key {
            x.right = delete(x.right, key)
        } else {
            if x.right == nil { // no right child
                return x.left
            }
            
            if x.left == nil { // no left child
                return x.right
            }
            
            let t = x
            x = min(t.right) // replace with successor
            x.right = deleteMin(t.right)
            x.left = t.left
        }
        
        x.count = size(x.left) + size(x.right) + 1
        return x
    }
    
    public func getIterator() {
        let q = QueuePrinceton<Key>()
        inorder(root, q)
    }
    
    private func inorder(_ x: Node?, _ q: QueuePrinceton<Key>) {
        guard let x = x else { return }
        
        inorder(x.left, q)
        
        q.enqueue(item: x.key)
        
        inorder(x.right, q)
    }
}







