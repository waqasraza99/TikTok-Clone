//
//  BounceLoaderView.swift
//  TikTokClone
//
//  Created by Waqas Raza on 30/01/2024.
//

import SwiftUI

struct BounceLoaderView: View {
    // MARK: - Properties
    @State private var offsetY1:CGFloat = 0.0
    @State private var offsetY2:CGFloat = 0.0
    @State private var offsetY3:CGFloat = 0.0
    let dotSize:CGFloat = 20.0
    let bounceDistance:CGFloat = 20.0
    let animationDuration:Double = 0.5
    let delayBetweenDots:Double = 0.2
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 20, content: {
            DotView()
                .offset(y:offsetY1)
            DotView()
                .offset(y:offsetY2)
            DotView()
                .offset(y:offsetY3)
        })
        .onAppear(perform: {
            animateDots()
        })
    }
    
    private func animateDots(){
        withAnimation(Animation.easeInOut(duration: animationDuration).repeatForever(autoreverses: true)) {
            offsetY1 = bounceDistance
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delayBetweenDots, execute: {
            withAnimation(Animation.easeInOut(duration: animationDuration).repeatForever(autoreverses: true)) {
                offsetY2 = bounceDistance
            }
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2 * delayBetweenDots, execute: {
            withAnimation(Animation.easeInOut(duration: animationDuration).repeatForever(autoreverses: true)) {
                offsetY3 = bounceDistance
            }
        })
    }
}

#Preview {
    BounceLoaderView()
        .preferredColorScheme(.dark)
}

struct DotView:View {
    let dotSize:CGFloat = 10.0
    var body: some View {
        Circle()
            .frame(width: dotSize,height: dotSize)
            .foregroundStyle(Color.orange)
    }
}
