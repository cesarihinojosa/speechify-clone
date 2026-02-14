//
//  LibraryView.swift
//  SpeechifyClone
//
//  Created by Cesar Hinojosa on 2/13/26.
//

import SwiftUI

struct LibraryView: View {
    @StateObject var libraryViewModel: LibraryViewModel = LibraryViewModel()
    @EnvironmentObject var playbackEngine: PlaybackEngine
    @State var searchText = ""
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(libraryViewModel.textItems){ textItem in
                    HStack{
                        Text(textItem.title)
                        Image((playbackEngine.state == .playing(id: textItem.id)) ? "speechify" : "")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .animation(.spring)
                        Spacer()
                        Text(textItem.text.dropLast(textItem.text.count - 20) + "...")
                            .font(.footnote)
                    }
                    .onTapGesture{
                        Task{
                            await playbackEngine.play(textItem: textItem)
                        }
                    }
                }
                .onDelete(perform: libraryViewModel.deleteTextItem)
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: "Search")
        }
    }
}

#Preview {
    NavigationStack{
        LibraryView()
    }
    .environmentObject(PlaybackEngine())
}
