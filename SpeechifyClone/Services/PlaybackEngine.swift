//
//  PlaybackEngine.swift
//  SpeechifyClone
//
//  Created by Cesar Hinojosa on 2/13/26.
//
import Foundation
import Combine

// TODO: actually implement this
@MainActor
class PlaybackEngine: ObservableObject {
    
    @Published var state: PlaybackState
    @Published var chunkText: String
    @Published var chunkIndex: Int
    @Published var progress: Float
    @Published var playbackSpeed: Float
    let textProcessingService: TextProcessingService = TextProcessingService()
    
    init(){
        state = .idle
        chunkText = ""
        chunkIndex = 0
        progress = 0
        playbackSpeed = 1.0
    }
    
    func play(textItem: TextItem) async {
        state = .playing(id: textItem.id)
        do {
            let chunks = try await textProcessingService.processText(textItem: textItem)
            print(chunks)
        } catch {
            print(error)
        }
    }
    
    func stop() {
        state = .finished
    }
    
    func pause(textItem: TextItem){
        state = .paused(id: textItem.id, chunkIndex: 0)
    }
    
}
