//
//  LinkedList.swift
//  SwiftAlgoStructs
//
//  Created by nag on 24/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

class LLNode<T> {
    var key: T?
    var next: LLNode?
    var previous: LLNode?
}

public class LinkedList<T: Equatable> {
    
    // new instance
    private var head = LLNode<T>()
    
    private var counter = 0
    
    // the number of items - O(1)
    var count: Int {
        return counter
    }
    
    // find subscript shortcut
    subscript(index: Int) -> LLNode<T>? {
        get {
            return find(at: index)
        }
    }
    
    //print all keys for the class
    func printAllKeys() {
        
        var current: LLNode? = head
        
        print("------------------")
        
        //assign the next instance
        
        while current != nil {
            print("link item is: \(String(describing: current?.key!))")
            current = current?.next
        }
        
    }
    
    // empty list check
    func isEmpty() -> Bool {
        return counter == 0 || head.key == nil
    }
    
    
    
    // add item
    func append(element key: T) {
        
        guard head.key != nil else {
            head.key = key
            counter += 1
            return
        }
        
        var current: LLNode? = head
        
        // position node
        while current != nil {
            if current?.next == nil {
                
                let childToUse = LLNode<T>()
                
                childToUse.key = key
                childToUse.previous = current
                
                current!.next = childToUse
                
                break
                
            } else {
                current = current?.next
            }
        }
        
        counter += 1
        
    }
    
    //insert at specific index
    func insert(_ key: T, at index: Int) {
        
        //check for nil conditions
        if index < 0 || index > self.count - 1 {
            print("link index does not exist..")
            return
        }
        
        //establish the head node
        guard head.key != nil else {
            head.key = key
            counter += 1
            return
        }
        
        //establish the trailer, current and new items
        var current: LLNode<T>? = head
        var trailer: LLNode<T>?
        var listIndex: Int = 0
        
        //iterate through the list to find the insertion point
        while (current != nil) {
            
            if index == listIndex {
                
                let childToUse: LLNode = LLNode<T>()
                
                //create the new node
                childToUse.key = key
                
                //connect the node infront of the current node
                childToUse.next = current
                childToUse.previous = trailer
                
                //use optional binding when using the trailer
                if let linktrailer = trailer {
                    linktrailer.next = childToUse
                    childToUse.previous = linktrailer
                }
                
                //point new node to the current / previous
                current!.previous = childToUse
                
                //replace the head node if required
                if (index == 0) {
                    head = childToUse
                }
                
                break
                
            } //end if
            
            //iterate through to the next item
            trailer = current
            current = current?.next
            listIndex += 1
            
        } //end while
        
        counter += 1
        
    }
    
    // remove node at specific index
    
    func remove(at index: Int) {
        
        if index < 0 || index > self.count - 1 || head.key == nil {
            print("Link index does not exist")
            return
        }
        
        var current: LLNode<T>? = head
        var trailer: LLNode<T>?
        var listIndex = 0
        
        // determine if the removal is at the head
        if index == 0 {
            current = current?.next
            head = current!
            counter -= 1
            return
        }
        
        // iterate through remaining items
        while current != nil {
            
            if listIndex == index {
                
                // redirect the trailer and next pointers
                trailer!.next = current?.next
                current = nil
                
                break
            }
            
            // update assignments
            trailer = current
            current = current?.next
            listIndex += 1
        }
        
        counter -= 1
        
    }
    
    // find link at a specific index
    func find(at index: Int) -> LLNode<T>? {
        if index < 0 || index > self.count - 1 || head.key == nil {
            print("Link index does not exist")
            return nil
        }
        
        var current: LLNode<T> = head
        var x = 0
        
        // cycle through elements
        while index != x {
            current = current.next!
            x += 1
        }
        
        return current
        
    }
    
    //reverse the order of a linked list
    func reverse() {
        
        //if count == 1 or count == 0,no need to reverse
        if self.count <= 1{
            return
        }
        
        
        var current : LLNode<T>? = head
        var next : LLNode<T>? = nil
        
        
        while(current != nil) {
            
            //reverse
            next = current!.next
            current!.next = current!.previous
            current!.previous = next
            
            
            if next == nil {
                head = current!
            }
            
            //move to next node
            current = next
            
        }
        
    }
    
    
    
}



















