//
//  ContentView.swift
//  AfterBite
//
//  Created by 박난 on 1/29/26.
//

import SwiftUI

struct ContentView: View {
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
            // 검은 배경
            Color.black
                .ignoresSafeArea()

            // 원형 타이머
            ZStack {
                // 원 안의 물
                WaterFillView(
                    waterLevel: waterLevel,
                    waterColor: Color(hex: "00ff94")
                )
                .frame(width: timerSize, height: timerSize)
                .clipShape(Circle())

                // 테두리
                Circle()
                    .stroke(Color(hex: "00ff94").opacity(0.5), lineWidth: 3)
                    .frame(width: timerSize, height: timerSize)

                // 시간 텍스트 (흰색 - 물 없는 영역)
                Text(formattedTime)
                    .font(.system(size: 44, weight: .medium, design: .monospaced))
                    .foregroundColor(.white)

                // 시간 텍스트 (검은색 - 물 있는 영역)
                Text(formattedTime)
                    .font(.system(size: 44, weight: .medium, design: .monospaced))
                    .foregroundColor(.black)
                    .mask(
                        WaterFillView(
                            waterLevel: waterLevel,
                            waterColor: .white
                        )
                        .frame(width: timerSize, height: timerSize)
                    )
            }
            .onTapGesture {
                toggleTimer()
            }
        }
        .onDisappear {
            timer?.invalidate()
        }
    }

    private func toggleTimer() {
        if isRunning {
            // 정지
            timer?.invalidate()
            timer = nil
            isRunning = false
        } else {
            // 시작
            isRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 0.1
                } else {
                    timer?.invalidate()
                    timer = nil
                    isRunning = false
                    timeRemaining = 0
                }
            }
        }
    }
}

// MARK: - Water Fill View
struct WaterFillView: View {
    var waterLevel: CGFloat
    var waterColor: Color

    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(waterColor)
                .frame(width: geometry.size.width, height: geometry.size.height * waterLevel)
                .offset(y: geometry.size.height * (1 - waterLevel))
        }
    }
}

// MARK: - Color Extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

#Preview {
    ContentView()
}
