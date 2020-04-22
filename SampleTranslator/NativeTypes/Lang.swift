//
//  Lang.swift
//  SampleTranslator
//
//  Created by Валентина on 21.04.2020.
//

import Foundation

class Lang {
    public let reduction : String
    public let defaultOpposite: String
    
    init(reduction : String, opposite: String) {
        self.reduction = reduction
        defaultOpposite = opposite
    }
    
    func isNativeWord(word: String) -> Bool {
        return false
    }
}
