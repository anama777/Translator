//
//  ContentView.swift
//  SampleTranslator
//
//  Created by Валентина on 21.04.2020.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var vm: TranslatorViewModel
     @State var items = [TipData]()
    
    init(vm: TranslatorViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter word", text: $vm.input)
                .padding(.all)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack {
                List(vm.tips) { tip in
                    TipRow(tip: tip)
                }
                List(vm.translations) { translation in
                    TranslationRow(translation: translation)
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let apiManager = APIManager.sharedAPI
        let langs : [Lang] = [
            RusLang(reduction: "ru", opposite: "en"),
            EnLang(reduction: "en", opposite: "ru")
        ]
        let vm = TranslatorViewModel(dependency: (apiManager, langs))
        
        return ContentView(vm: vm)
    }
}
