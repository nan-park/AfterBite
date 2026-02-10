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
                    .foregroundColor(.primaryGreen)
                    .frame(width: 206, height: 206)
                
                Circle()
                    .foregroundColor(.grey90)
                    .frame(width: 180)
                
                Text("10:00")
                    .font(.system(size: 53, weight: .medium))
                    .foregroundColor(.white)
            }
            .padding(.vertical, 36)
            
            Button {
                // WalkView로 이동(확장 모션)
            } label: {
                Text("Start")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(.white)
                    .cornerRadius(19)
            }
            .padding(.horizontal, 16)
            
        }
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity)
        .background(.grey90)
        .cornerRadius(10)
    }
}

#Preview {
    WalkCard()
}
