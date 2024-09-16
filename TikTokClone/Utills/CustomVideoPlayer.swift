//
//  CustomVideoPlayer.swift
//  TikTokClone
//
//  Created by Waqas Raza on 13/12/2023.
//

import Foundation
import SwiftUI
import AVKit


struct CustomVideoPlayer:UIViewControllerRepresentable{
    
    let player:AVPlayer
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.exitsFullScreenWhenPlaybackEnds = true
        controller.allowsPictureInPicturePlayback = true
        controller.videoGravity = .resizeAspectFill
//        playerItem.showsPlaybackControls = false
        
        return controller
        }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
        
    }
}
