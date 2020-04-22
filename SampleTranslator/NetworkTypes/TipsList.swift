//
//  TipsList.swift
//  SampleTranslator
//
//  Created by Валентина on 22.04.2020.
//

import Foundation

public class TipsList : Codable {
    public let data : [Tip]
    
    public func toTipData() -> [TipData] {
        var result = [TipData]()
        var id = 0
        for t in data {
            result.append(TipData(id: id, name: t.name))
            id += 1
        }
        
        return result
    }
}
