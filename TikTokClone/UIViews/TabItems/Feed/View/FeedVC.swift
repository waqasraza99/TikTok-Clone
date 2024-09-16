//
//  FeedVC.swift
//  TikTokClone
//
//  Created by Waqas Raza on 13/12/2023.
//

import SwiftUI
import AVKit

struct FeedVC: View {
    
    @StateObject var feedsVM = FeedsVM()
    @State private var scrollPosition: String?
    
    var body: some View {
        ZStack{
            if(feedsVM.isLoading){
                ProgressView()
                    .tint(.white)
            }
            
            
            ScrollView {
                LazyVStack(spacing: 0) {
                   
                    ForEach(feedsVM.videosList) { video in
                        
                        FeedsCellVC(video: video)
//                        let videosList = video.videoFiles ?? []
//                        FeedsCellVC(video: video, video: videosList[0].link)
//                            .id(video.id)
                        
                    }
                    
                }
                .scrollPosition(id: $scrollPosition)
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.paging)
            .ignoresSafeArea()
        }
        .onAppear {
            feedsVM.getFeedVideos()
            print(feedsVM.videosList)
        }
    }
    
    // Function to play the video
    func playVideo(url: String) {
        guard let videoURL = URL(string: url) else {
            return
        }
        let playerItem = AVPlayerItem(url: videoURL)
        let player = AVPlayer(playerItem: playerItem)
        player.play()
    }
}

