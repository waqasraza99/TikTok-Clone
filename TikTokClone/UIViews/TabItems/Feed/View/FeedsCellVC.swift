//
//  FeedsCellVC.swift
//  TikTokClone
//
//  Created by Waqas Raza on 13/12/2023.
//

import SwiftUI
import AVKit

struct FeedsCellVC: View {
    
    let video:Videos
//    let url:String
    var player : AVPlayer

    @State var user = User()
    

    init(video: Videos) {
            self.video = video
            self.player = AVPlayer(url: URL(string: video.url!)!)
        print(video.url as Any)
        }
    
    var body: some View {
        
        ZStack{
            
//            
            CustomVideoPlayer(player: player)
                .containerRelativeFrame([.horizontal, .vertical])
            
//            VideoPlayer(player: AVPlayer(url: URL(string: video.url!)!))
//                .containerRelativeFrame([.horizontal, .vertical])
            
            
            
            
            VStack{
                
                Spacer()
                
                HStack(alignment: .bottom){
                    
                    VStack{
                        
                        HStack{
                            
                            Text(user.name ?? "")
                                .font(.system(size: 16,weight: .bold))
                         
                            Spacer()
                        }
                        
                        HStack{
                            
                            Text(user.url ?? "")
                                .font(.system(size: 14,weight: .regular))
                            
                         
                            Spacer()
                            
                        }
                    }.foregroundColor(.white)
                    
                    Spacer()
                    
                    VStack(spacing: 0){
                        
                        Button{
                            
                            
                        } label: {
                            
                            Image(systemName: "heart.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 32,height: 32)
                            
                        }
                        
                        Text("100k")
                        
                        Button{
                            
                            
                        } label: {
                            
                            Image(systemName: "ellipsis.bubble.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 32,height: 32)
                            
                        }.padding(.top)
                        
                        Text("100k")
                        
                        Button{
                            
                            
                        } label: {
                            
                            Image(systemName: "arrowshape.turn.up.forward.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 32,height: 32)
                            
                        }.padding(.top)
                        
                        Text("100k")
                        
                    }.foregroundColor(.white)
                    
                    
                }
                
            }.padding(.bottom,100)
                .padding(.horizontal)
            
            
        }.onTapGesture {
            switch player.timeControlStatus {
            case .paused:
                player.play()
            case .waitingToPlayAtSpecifiedRate:
                break
            case .playing:
                player.pause()
            @unknown default:
                break
            }
        }
        .containerRelativeFrame([.vertical,.horizontal]).onAppear{
            
            user = video.user ?? User()
            
           
            
        }
    }
    
    
}

