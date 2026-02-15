//
//  WalkView.swift
//  AfterBite
//
//  Created by 박난 on 1/29/26.
//

import SwiftUI

struct WalkCard: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(.disable)
                    .frame(width: 220, height: 220)
                
                Circle()
                    .foregroundColor(.cardBackground)
                    .frame(width: 194)
                
                Text("10:00")
                    .font(.system(size: 56, weight: .medium))
                    .foregroundColor(.white)
            }
            .padding(.vertical, 36)
            
            Button {
                // WalkView로 이동(확장 모션)
            } label: {
                Text("Label")
                    .font(.label3)
                    .foregroundColor(.textBlack)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(.primaryGreen)
                    .cornerRadius(19)
            }
            .padding(.horizontal, 36)
            
        }
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity)
        .background(.cardBackground)
        .cornerRadius(10)
    }
}

#Preview {
    WalkCard()
}
