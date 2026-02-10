//
//  ContentView.swift
//  AfterBite
//
//  Created by 박난 on 1/29/26.
//

import SwiftUI

struct MainView: View {
    @State private var timeRemaining: TimeInterval = 600 // 10분 = 600초
    @State private var isRunning = false
    @State private var timer: Timer?

    private let totalTime: TimeInterval = 600

    var waterLevel: CGFloat {
        CGFloat(timeRemaining / totalTime)
    }

    var formattedTime: String {
        let minutes = Int(timeRemaining) / 60
        let seconds = Int(timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    private let timerSize: CGFloat = 250

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 8) {
                Spacer()
                    .frame(height: 30)
                
                HStack {
                    Text("Walk")
                        .foregroundColor(.white)
                    Spacer()
                }
                
                // WalkView
                RoundedRectangle(cornerRadius: 10)
                    .fill(.grey90)
                    .frame(height: 100)
                
                Spacer()
                    .frame(height: 28)
                
                HStack {
                    Text("Record")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 16))
                        .foregroundStyle(.white)
                    
                    Spacer()
                        .frame(width: 16)
                }
                
                // RecordView
                RoundedRectangle(cornerRadius: 10)
                    .fill(.grey90)
                    .frame(height: 100)
                
                Spacer()
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    MainView()
}
