//
//  TipRow.swift
//  SampleTranslator
//
//  Created by Валентина on 22.04.2020.
//

import SwiftUI

struct TipRow: View {
    var tip : TipData
    
    var body: some View {
        HStack {
            Text(tip.name)
            Spacer()
        }
    }
}

struct TipRow_Previews: PreviewProvider {
    static var previews: some View {
        TipRow(tip: TipData(id: 0, name: "text"))
    }
}
