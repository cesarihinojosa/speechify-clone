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
    
    var body: some View {
        NavigationStack{
            List{ // break this up later
                ForEach(libraryViewModel.filteredTextItems){ textItem in
                    HStack{
                        Text(textItem.title)
                        if playbackEngine.state == .playing(id: textItem.id) {
                            Image("speechify")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        Spacer()
                        VStack{
                            Text(textItem.text.dropLast(textItem.text.count - 20) + "...")
                                .font(.footnote)
                            Text(textItem.timeStamp, style: .date)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                    }
                    .frame(height: 30)
                    .onTapGesture{
                        Task {
                            await playbackEngine.play(textItem: textItem)
                        }
                    }
                }
                .onDelete(perform: libraryViewModel.deleteTextItem)
            }
            .sheet(isPresented: $libraryViewModel.showAddItemSheet) {
                AddItemView{ title, content in
                    libraryViewModel.addTextItem(title: title, content: content)
                }
            }
            .searchable(text: $libraryViewModel.search, placement: .navigationBarDrawer, prompt: "Search")
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        libraryViewModel.sortByNewest.toggle()
                     } label: {
                         Image(systemName: "arrow.up.arrow.down")
                     }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        libraryViewModel.showAddItemSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        LibraryView()
            .environmentObject(PlaybackEngine())
    }
}
