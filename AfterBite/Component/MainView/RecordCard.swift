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
            HStack {
                Text("January")
                    .font(.label2)
                    .foregroundColor(.textWhite)
                
                Spacer()
            }
        }
        .padding(.horizontal, 37)
        .padding(.vertical, 32)
        .frame(maxWidth: .infinity)
        .background(.cardBackground)
        .cornerRadius(10)
    }
}

#Preview {
    RecordCard()
}
