//
//  SpeechifyCloneApp.swift
//  SpeechifyClone
//
//  Created by Cesar Hinojosa on 2/13/26.
//

import SwiftUI

@main
struct SpeechifyCloneApp: App {
    @StateObject var playbackEngine = PlaybackEngine()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(playbackEngine)
    }
}
