//
//  TextProcessingService.swift
//  SpeechifyClone
//
//  Created by Cesar Hinojosa on 2/13/26.
//
import Foundation

actor TextProcessingService {
    
    var cache: [String: [String]] = [:]
    
    func processText(textItem: TextItem) async throws -> [String] {
        // do more processing later
        let chunks: [String]
        if let cached = cache[textItem.id] {
            chunks = cached
        } else {
            try await Task.sleep(nanoseconds: 3000000000)
            chunks = textItem.text.components(separatedBy: ". ")
            cache[textItem.id] = chunks
        }
        return chunks
    }
    
    func clearCache(){
        cache.removeAll()
    }
    
}
