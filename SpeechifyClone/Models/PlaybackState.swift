//
//  PlaybackState.swift
//  SpeechifyClone
//
//  Created by Cesar Hinojosa on 2/13/26.
//

enum PlaybackState: Equatable {
    case idle
    case playing(id: String)
    case paused(id: String, chunkIndex: Int)
    case finished
}
