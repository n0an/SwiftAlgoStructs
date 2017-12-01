//
//  Sortable.swift
//  SwiftAlgoStructsTests
//
//  Created by Anton Novoselov on 01/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

//determine sort order
protocol Sortable {
    
    func isSorted<T: Comparable>(_ sequence: Array<T>) -> Bool
}

extension Sortable {
    
    func isSorted<T: Comparable>(_ sequence: Array<T>) -> Bool {
        
        //check trivial cases
        guard sequence.count >= 1 else {
            return true
        }
        
        var index = sequence.startIndex
        
        //compare sequence values
        while index < sequence.endIndex - 1 {
            if sequence[index] > sequence[sequence.index(after: index)] {
                return false
            }
            index = sequence.index(after: index)
        }
        
        return true
    }
    
}
