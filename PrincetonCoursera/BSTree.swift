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
    
    // --- inner Node class
    public class Node {
        public var key: Key
        public var val: Value
        public var left: Node?
        public var right: Node?
        
        public var count: Int
        
        init(key: Key, val: Value, count: Int) {
            self.key = key
            self.val = val
            self.count = count
        }
    }
    
    // --- Size ---
    public func size() -> Int {
        return size(root)
    }
    
    private func size(_ x: Node?) -> Int {
        guard let x = x else { return 0 }
        return x.count
    }
    
    // --- Put ---
    public func put(key: Key, val: Value) {
        // Search for key. Update value if found; grow table if new.
        root = put(root, key, val)
    }
    
    private func put(_ x: Node?, _ key: Key, _ val: Value) -> Node {
        // Change key’s value to val if key in subtree rooted at x.
        // Otherwise, add new node to subtree associating key with val.
        
        guard let x = x else { return Node(key: key, val: val, count: 1) }
        
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
    
    // --- Get ---
    public func get(key: Key) -> Value? {
        return get(root, key)
    }
    
    private func get(_ x: Node?, _ key: Key) -> Value? {
        // Return value associated with key in the subtree rooted at x;
        // return nil if key not present in subtree rooted at x.
        
        guard let x = x else { return nil }
        
        if key < x.key {
            return get(x.left, key)
        } else if key > x.key {
            return get(x.right, key)
        } else {
            return x.val
        }
    }

//    public func get(key: Key) -> Value? {
//        var x = root
//
//        while x != nil {
//            if key < (x?.key)! {
//                x = x?.left
//            } else if key < (x?.key)! {
//                x = x?.right
//            } else {
//                return x!.val
//            }
//        }
//        return nil
//    }
    
    // --- Select ---
    public func select(_ k: Int) -> Key {
        return select(root, k)!.key
    }
    
    private func select(_ x: Node?, _ k: Int) -> Node? {
        // Return Node containing key of rank k.
        
        guard let x = x else { return nil }
        
        let t = size(x.left)
        
        if t > k {
            return select(x.left, k)
        } else if t < k {
            return select(x.right, k - t - 1)
        } else {
            return x
        }
    }
    
    // --- Rank ---
    public func rank(key: Key) -> Int {
        return rank(key: key, x: root)
    }
    
    private func rank(key: Key, x: Node?) -> Int {
        // Return number of keys less than x.key in the subtree rooted at x.
        
        guard let x = x else { return 0 }
        
        if key < x.key {
            return rank(key: key, x: x.left)
        } else if key > x.key {
            return 1 + size(x.left) + rank(key: key, x: x.right)
        } else {
            return size(x.left)
        }
    }
    
    // --- Min ---
    public func min() -> Key {
        return min(root).key
    }
    
    private func min(_ x: Node) -> Node {
        if x.left == nil {
            return x
        }
        
        return min(x.left!)
    }
    
    // --- Max ---
    public func max() -> Key {
        return max(root).key
    }
    
    private func max(_ x: Node) -> Node {
        if x.right == nil {
            return x
        }
        
        return max(x.right!)
    }
    
    // --- Floor ---
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
    
    // --- Delete Min ---
    public func deleteMin() {
        root = deleteMin(root)
    }
    
    private func deleteMin(_ x: Node) -> Node {
        if x.left == nil {
            return x.right!
        }
        
        x.left = deleteMin(x.left!)
        x.count = 1 + size(x.left) + size(x.right)
        
        return x
    }
    
    // --- Hibbard deletion ---
    public func delete(key: Key) {
        root = delete(root, key)
    }
    
    private func delete(_ x: Node?, _ key: Key) -> Node? {
        guard var x = x else { return nil }
        
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
            x = min(t.right!) // replace with successor
            x.right = deleteMin(t.right!)
            x.left = t.left
        }
        
        x.count = size(x.left) + size(x.right) + 1
        return x
    }
    
    // --- Print ---
    // Printing the keys in a BST in order
    public func printOut(_ x: Node?) {
        guard let x = x else { return }
        
        printOut(x.left)
        
        print(x.key)
        
        printOut(x.right)
    }
    
    
    
    // --- Iterator 1
    func makeIterator() -> Queue<Key> {
        return keys(min(), max())
        
    }
    
    func keys(_ lo: Key, _ hi: Key) -> Queue<Key> {
        let queue = Queue<Key>()
        keys(root, queue, lo, hi)
        return queue
    }
    
    private func keys(_ x: Node?, _ queue: Queue<Key>, _ lo: Key, _ hi: Key) {
        guard let x = x else { return }
        if lo < x.key {
            keys(x.left, queue, lo, hi)
        }
        if lo < x.key && hi >= x.key {
            queue.enqueue(item: x.key)
        }
        if hi > x.key {
            keys(x.right, queue, lo, hi)
        }
    }
    
    // --- Iterator 2
    private func getIterator() -> Queue<Key> {
        let q = Queue<Key>()
        inorder(root, q)
        return q
    }
    
    private func inorder(_ x: Node?, _ q: Queue<Key>) {
        guard let x = x else { return }
        
        inorder(x.left, q)
        
        q.enqueue(item: x.key)
        
        inorder(x.right, q)
    }
}





