//
//  Tip.swift
//  SampleTranslator
//
//  Created by Валентина on 22.04.2020.
//

import Foundation

public class Tip : Codable {
    public let lang : String
    public let name : String
    
    public init() {
        self.lang = ""
        self.name = ""
    }
}
