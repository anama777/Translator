//
//  StringExtensions.swift
//  SampleTranslator
//
//  Created by Валентина on 21.04.2020.
//

import Foundation

extension String {
    func isValidWord() -> Bool {
        if self.count == 0 {
            return false
        }
        
        let regEx = "^[a-zA-Zа-яА-Я]*$"
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: self)
    }
}
