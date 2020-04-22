//
//  TranslationsList.swift
//  SampleTranslator
//
//  Created by Валентина on 22.04.2020.
//

import Foundation

public class TranslationsList : Codable {
    public let data : [Translation]
    
    public func toTranslationData() -> [TranslationData] {
        var result = [TranslationData]()
        var id = 0
        for t in data {
            result.append(TranslationData(id: id, name: t.translation_word.name))
            id += 1
        }
        
        return result
    }
}
