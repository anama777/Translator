//
//  EnLang.swift
//  SampleTranslator
//
//  Created by Валентина on 21.04.2020.
//

import Foundation

class EnLang : Lang {
    override func isNativeWord(word: String) -> Bool {
        let regEx = "^[a-zA-Z]*$"
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: word)
    }
}
