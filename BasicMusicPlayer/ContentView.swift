//
//  ContentView.swift
//  BasicMusicPlayer
//
//  Created by AM Student on 9/7/23.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @State var audioPlayer: AVAudioPlayer!
    @State var count = 1
    
    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea(.all)
            VStack {
                Image("bron")
                    .resizable()
                    .frame(width: 80, height: 100)
                HStack {
                    Text("Music Player")
                        .font(.system(size: 45))
                        .fontWeight(.bold).multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }
                Image("bron")
                    .resizable()
                    .frame(width: 125, height: 200)
                HStack {
                    Button(action: {
                        self.audioPlayer.play()
                    }) {
                        Image(systemName: "play.fill")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .foregroundColor(Color("textColor"))
                    }
                    
                    Button(action: {
                        self.audioPlayer.pause()
                    }) {
                        Image(systemName: "pause.fill")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .foregroundColor(Color("textColor"))
                    }
                    
                    Button(action: {
                        if self.count < 3 {
                            self.count += 1
                        } else {
                            self.count = 1
                        }
                        let sound = Bundle.main.path(forResource: "song\(self.count)", ofType: "mp3")
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                        self.audioPlayer.play()
                    }) {
                        Image(systemName: "arrow.forward")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .foregroundColor(Color("textColor"))
                    }
                }
                Image("bron")
                    .resizable()
                    .frame(width: 80, height: 100)
                    .padding(.top)
            }
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "song1", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: sound!))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
