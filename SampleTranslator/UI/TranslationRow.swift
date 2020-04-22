//
//  TranslationRow.swift
//  SampleTranslator
//
//  Created by Валентина on 22.04.2020.
//

import SwiftUI

struct TranslationRow: View {
    var translation: TranslationData
    
    var body: some View {
        HStack {
            Text(translation.name)
            Spacer()
        }
    }
}

struct TranslationRow_Previews: PreviewProvider {
    static var previews: some View {
        TranslationRow(translation: TranslationData(id: 0, name: "text"))
    }
}
