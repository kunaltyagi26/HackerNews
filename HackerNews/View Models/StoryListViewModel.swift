//
//  StoryListViewModel.swift
//  HackerNews
//
//  Created by Kunal Tyagi on 01/11/20.
//

import Foundation
import Combine

class StoryListViewModel: ObservableObject {
    @Published var stories: [StoryViewModel] = []
    private var cancellable: AnyCancellable?
    
    init() {
        fetchTopStories()
    }
    
    func fetchTopStories() {
        cancellable = Webservice().getAllTopStories().map { stories in
            stories.map { StoryViewModel(story: $0) }
        }
        .sink(receiveCompletion: { _ in }, receiveValue: { storyViewModels in
            self.stories = storyViewModels
        })
    }
}

struct StoryViewModel {
    let story: Story
    
    var id: Int {
        return story.id
    }
    
    var title: String {
        return story.title
    }
    
    var url: String {
        return story.url
    }
}
