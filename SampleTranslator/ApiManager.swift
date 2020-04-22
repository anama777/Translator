//
//  ApiManager.swift
//  SampleTranslator
//
//  Created by Валентина on 21.04.2020.
//

import Foundation
import RxAlamofire
import RxSwift

protocol APIProtocol {
    func transLate(word: String, from: String, to: String) -> Observable<(HTTPURLResponse, Any)>
    func tips(word: String, from: String, to: String) -> Observable<(HTTPURLResponse, Any)>
}

public class APIManager : APIProtocol {
    static let sharedAPI = APIManager()
    
    private let host = "aee3qlxcg2.execute-api.eu-central-1.amazonaws.com"
    private let vers = "/v1"
    private let translate = "/translations"
    private let tips = "/words/tooltips"
    
    public func transLate(word: String, from: String, to: String) -> Observable<(HTTPURLResponse, Any)> {
        let url = formUrl(request: translate, word: word, from: from, to: to)
        return RxAlamofire.requestJSON(.get, url)
    }
    
    public func tips(word: String, from: String, to: String) -> Observable<(HTTPURLResponse, Any)> {
        let url = formUrl(request: tips, word: word, from: from, to: to)
        return RxAlamofire.requestJSON(.get, url)
    }
    
    private func formUrl(request path: String, word: String, from: String, to: String) -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = vers + path
        urlComponents.queryItems = [
            URLQueryItem(name: "search", value: word),
            URLQueryItem(name: "lang", value: from),
            URLQueryItem(name: "lang_t", value: to)
        ]
        
        return urlComponents.url!
    }
}
