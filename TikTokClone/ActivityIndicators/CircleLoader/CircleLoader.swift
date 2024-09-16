//
//  CircleLoader.swift
//  TikTokClone
//
//  Created by Waqas Raza on 30/01/2024.
//

import SwiftUI

struct CircleLoader: View {
    
    @State private var angle:Double = 0.0

    var body: some View {
        Circle()
                   .trim(from: 0.1, to: 1.0)
                   .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                   .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .top, endPoint: .bottom))
                   .shadow(color: .orange.opacity(0.5), radius: 10, x: 0, y: 0)
                   .frame(width: 200, height: 200)
                   .rotationEffect(Angle(degrees: angle))
                   .onAppear {
                       withAnimation(Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                           angle = 360
                       }
                   }
           }
        
}

#Preview {
    CircleLoader()
}
