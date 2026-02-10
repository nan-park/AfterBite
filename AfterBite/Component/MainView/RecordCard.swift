//
//  RecordView.swift
//  AfterBite
//
//  Created by 박난 on 1/29/26.
//

import SwiftUI

struct RecordCard: View {
    var body: some View {
        VStack {
            Text("Record")
        }
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity)
        .background(.grey90)
        .cornerRadius(10)
    }
}

#Preview {
    RecordCard()
}
