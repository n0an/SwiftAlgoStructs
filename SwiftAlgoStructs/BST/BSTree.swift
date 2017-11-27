//
//  BSTree.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 27/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

// *** Bishop

class BSTree<T: Comparable> {
    
    var root = BSNode<T>()
    
    private var elementStack = Stack<BSNode<T>>()
    
    func append(key: T) {
        
        guard root.key != nil else {
            root.key = key
            root.height = 0
            return
        }
        
        // set initial indicator
        var current = root
        
        while let currentKey = current.key {
            
            // send reference of current item to stack
            self.push(element: &current)

            // check left side
            if key < currentKey {
                
                if let currentLeft = current.left {
                    current = currentLeft
                    
                } else {
                    // create new element
                    let childToAdd = BSNode<T>()
                    childToAdd.key = key
                    current.left = childToAdd
                    break
                }
            }
            
            // check right side
            if key > currentKey {
                
                if let currentRight = current.right {
                    current = currentRight
                    
                } else {
                    // create new element
                    let childToAdd = BSNode<T>()
                    childToAdd.key = key
                    current.right = childToAdd
                    break
                }
            }
            
        }
        
        self.rebalance()
    }
    
    // equality test - O(log n)
    func contains(key: T) -> Bool {
        
        var current = root
        
        while let currentKey = current.key {
            
            // test match
            if key == currentKey {
                return true
            }
            
            // check left side
            if key < currentKey {
                if let currentLeft = current.left {
                    current = currentLeft
                    continue
                } else {
                    return false
                }
            }
            
            // check right side
            if key > currentKey {
                if let currentRight = current.right {
                    current = currentRight
                    continue
                } else {
                    return false
                }
            }
        }
        return false
    }
    
    // stack elements for later processing
    private func push(element: inout BSNode<T>) {
        elementStack.push(key: element)
        print("the stack count is: \(elementStack.count)")
    }
    
    // determine height and balance
    private func rebalance() {
        
        for _ in stride(from: elementStack.count, through: 1, by: -1) {
            
            // obtain generic stack node - by reference
            let current = elementStack.peek()
            
            guard let bsNode = current.key else {
                print("No element reference found")
                continue
            }
            
            setHeight(for: bsNode)
            rotate(element: bsNode)
            
            // remove stacked item
            elementStack.pop()
        }
    }
    
    
    // MARK: - HIGHT METHODS
    private func findHeight(of element: BSNode<T>?) -> Int {
        
        // check empty leaves
        guard let bsNode = element else {
            return -1
        }
        return bsNode.height
    }
    
    private func setHeight(for element: BSNode<T>) {
        
        // set leaf variables
        var elementHeight = 0
        
        // compare and calculate height
        elementHeight = max(findHeight(of: element.left), findHeight(of: element.right)) + 1
        
        element.height = elementHeight
    }
    
    
    
    //MARK: - BALANCING METHODS
    //determine if the tree is "balanced" - operations on a balanced tree is O(log n)
    func isTreeBalanced(for element: BSNode<T>?) -> Bool {
        
        guard element?.key != nil else {
            print("No element provided")
            return false
        }
        
        if abs(findHeight(of: element?.left) - findHeight(of: element?.right)) <= 1 {
            return true
            
        } else {
            return false
        }
    }
    
    // perform left or right rotation
    private func rotate(element: BSNode<T>) {
        
        guard element.key != nil else {
            print("cannot rotate: no key provided..")
            return
        }
        
        if (self.isTreeBalanced(for: element) == true) {
            print("node: \(element.key!) already balanced..")
            return
        }
        
        // create new element
        let childToUse = BSNode<T>()
        childToUse.height = 0
        childToUse.key = element.key
        
        // determine side imbalance
        let rightSide = findHeight(of: element.left) - findHeight(of: element.right)
        let leftSide = findHeight(of: element.right) - findHeight(of: element.left)
        
        if rightSide > 1 {
            
            print("\n starting right rotation on \(element.key!)..")
            
            //reset the root node
            element.key = element.left?.key
            element.height = findHeight(of: element.left)
            
            
            //assign the new right node
            element.right = childToUse
            
            
            //adjust the left node
            element.left = element.left?.left
            element.left?.height = 0
            
            print("root is: \(element.key!) | left is : \(element.left!.key!) | right is : \(element.right!.key!)..")
        }
            
        else if leftSide > 1 {
            
            print("\n starting left rotation on \(element.key!)..")
            
            //reset the root node
            element.key = element.right?.key
            element.height = findHeight(of: element.right)
            
            
            //assign the new left node
            element.left = childToUse
            
            
            //adjust the right node
            element.right = element.right?.right
            element.right?.height = 0
            
            print("root is: \(element.key!) | left is : \(element.left!.key!) | right is : \(element.right!.key!)..")
            
        }
        
    }
    
}









