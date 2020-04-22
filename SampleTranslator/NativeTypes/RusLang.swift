//
//  RusLang.swift
//  SampleTranslator
//
//  Created by Валентина on 21.04.2020.
//

import Foundation

class RusLang : Lang {
    override func isNativeWord(word: String) -> Bool {
        let regEx = "^[а-яА-Я]*$"
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: word)
    }
}
