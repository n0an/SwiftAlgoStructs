//
//  BSNode.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 27/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

class BSNode<T> {
    var key: T?
    var left: BSNode?
    var right: BSNode?
    var height = 0
    
    init() {
        self.height = -1
    }
    
    var count: Int {
        let left = self.left?.count ?? 0
        let right = self.right?.count ?? 0
        return left + 1 + right
    }
    
    //regular dfs traversal
    func traverse() {
        
        //trivial condition
        guard let key = self.key else {
            print("no key provided..")
            return
        }
        
        //process the left side
        if self.left != nil {
            left?.traverse()
        }
        
        print("...the value is: \(key) - height: \(self.height)..")
        
        //process the right side
        if self.right != nil {
            right?.traverse()
        }
    }
    
    
    //use dfs with trailing closure to update all values
    func traverse(withFormula formula: (BSNode<T>) -> T) {
        
        //check for trivial condition
        guard self.key != nil else {
            print("no key provided..")
            return
        }
        
        //process the left side
        if self.left != nil {
            left?.traverse(withFormula: formula)
        }
        
        //invoke formula - apply results
        let newKey: T = formula(self)
        self.key! = newKey
        
        print("...the updated value is: \(self.key!) - height: \(self.height)..")
        
        //process the right side
        if self.right != nil {
            right?.traverse(withFormula: formula)
        }
    }
}


