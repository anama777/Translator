//
//  Translation.swift
//  SampleTranslator
//
//  Created by Валентина on 22.04.2020.
//

import Foundation

public class Translation : Codable {
    public let id : Int
    public let primary_word : WordDescription
    public let translation_word : WordDescription
    public let translation_lang_id : Int
    public let is_verified : Bool
    public let properties : TranslationProps
    public let is_this_user : Bool
    public let meaning : String
    public let sentences : [String]
}

public class WordDescription : Codable {
    public let id : Int
    public let name : String
    public let attributes : [String]
    public let is_verified : Bool
    public let lang_id : Int
    public let properties : TranslationProps
    public let is_this_user : Bool
    public let transcriptions : [Transcription]
    public let audios : [AudioDescription]
}

public class TranslationProps : Codable {
    public let author : String
    public let source : String
}

public class Transcription : Codable {
    public let transcription : String
    public let type : String
}

public class AudioDescription : Codable {
    public let id : Int
    public let name : String
    public let url : String
    public let type : String
    public let is_remote : Bool
}
