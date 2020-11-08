//
//  StoryListView.swift
//  HackerNews
//
//  Created by Kunal Tyagi on 08/11/20.
//

import SwiftUI

struct StoryListView: View {
    @ObservedObject private var storyListViewModel = StoryListViewModel()
    
    var body: some View {
        NavigationView {
            if storyListViewModel.stories.isEmpty {
                ProgressView()
                    .navigationBarTitle("Hacker News", displayMode: .inline)
            } else {
                ScrollView {
                    LazyVStack {
                        ForEach(storyListViewModel.stories, id: \.id) { storyVM in
                            HStack {
                                NavigationLink(
                                    destination: StoryDetailView(storyId: storyVM.id),
                                    label: {
                                        Text("\(storyVM.title)")
                                            .padding(.leading, 16)
                                            .padding(.top, 8)
                                            .foregroundColor(Color.black)
                                        Spacer()
                                    })
                            }
                            
                        }
                    }
                }
                .navigationBarTitle("Hacker News", displayMode: .inline)
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
