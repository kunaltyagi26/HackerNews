//
//  StoryDetailView.swift
//  HackerNews
//
//  Created by Kunal Tyagi on 08/11/20.
//

import SwiftUI

struct StoryDetailView: View {
    @ObservedObject var storyDetailVM: StoryDetailViewModel
    var storyId: Int
    
    init(storyId: Int) {
        self.storyId = storyId
        storyDetailVM = StoryDetailViewModel()
    }
    
    var body: some View {
        VStack {
            if storyDetailVM.title == "N/A" && storyDetailVM.url == "" {
                ProgressView()
            } else {
                Text(storyDetailVM.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                WebView(url: storyDetailVM.url)
            }
            
        }.onAppear {
            self.storyDetailVM.fetchStoryDetails(storyId: self.storyId)
        }
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(storyId: 25025066)
    }
}
