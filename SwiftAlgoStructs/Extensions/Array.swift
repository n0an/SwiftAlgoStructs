//
//  Array.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 01/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    mutating func quickSort() -> Array<Element> {
        
        func sort(lo: Int, hi: Int) {
            guard hi > lo else { return }
            
            let j = qPartition(lo: lo, hi: hi)
            
            sort(lo: lo, hi: j - 1)
            sort(lo: j + 1, hi: hi)
        }
        
        sort(lo: 0, hi: self.endIndex - 1)
        return self
    }
    
    mutating func qPartition(lo: Int, hi: Int) -> Int {
        var i = lo
        var j = hi + 1
        
        mainLoop: while true {
            
            // rewind i
            insideLoop: repeat {
                i += 1
                if i == hi {
                    break insideLoop
                }
            } while self[i] < self[lo]
            
            // rewind j
            insideLoop: repeat {
                j -= 1
                if j == lo {
                    break insideLoop
                }
            } while self[lo] < self[j]
            
            if i >= j {
                break mainLoop
            }
            
            self.swapAt(i, j)
        }
        
        self.swapAt(lo, j)
        
        return j
    }
    
}
