//
//  TranslatorViewModel.swift
//  SampleTranslator
//
//  Created by Валентина on 21.04.2020.
//

import Combine
import RxSwift

public class TranslatorViewModel : ObservableObject, Identifiable {
    @Published var input = ""
    @Published var tips = [TipData]()
    @Published var translations = [TranslationData]()
    
    private var cancelables = Set<AnyCancellable>()
    private let bag = DisposeBag()
    private var api: APIProtocol
    private var langs: [Lang]
    
    
    init(dependency: (api: APIProtocol, langs: [Lang]),
         scheduler: DispatchQueue = DispatchQueue(label: "TranslatorViewModel")) {
        self.api = dependency.api
        self.langs = dependency.langs
        _ = $input
            .debounce(for: .seconds(0.3), scheduler: scheduler)
            .map {$0.lowercased()}
            .sink(receiveValue: translate(input:))
            .store(in: &cancelables)
    }
    
    func translate(input: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) { [weak self] in
            if input.isValidWord() {
                if let lang = self?.detectLang(input),
                    let translationRequest = self?.api.transLate(word: input,
                                                                from: lang.reduction,
                                                                to: lang.defaultOpposite),
                    let tipsRequest = self?.api.tips(word: input,
                                                    from: lang.reduction,
                                                    to: lang.defaultOpposite) {
                    _ = Observable.zip(translationRequest, tipsRequest) {
                        translationResponse, tipsResponse in
                        return (translationResponse, tipsResponse)
                    }.subscribe(onNext: { [weak self] (translation, tips) in
                        if let translationJson = translation.1 as? [String : AnyObject],
                            let tipsJson = tips.1 as? [String : AnyObject] {
                            
                            let decoder = JSONDecoder()
                            let tipsList = try! decoder.decode(TipsList.self, withJSONObject: tipsJson)
                            let translationsList = try! decoder.decode(TranslationsList.self, withJSONObject: translationJson)
                            
                            self?.tips = tipsList.toTipData()
                            self?.translations = translationsList.toTranslationData()
                        }
                        },
                        onError: { error in
                            print(error.localizedDescription)
                            self?.tips = []
                            self?.translations = []
                    }).disposed(by: self!.bag)
                }
            } else {
                self?.tips = []
                self?.translations = []
            }
        }
    }
    
    func detectLang(_ input: String) -> Lang? {
        for lang in langs {
            if lang.isNativeWord(word: input) {
                return lang
            }
        }
        
        return nil
    }
}



