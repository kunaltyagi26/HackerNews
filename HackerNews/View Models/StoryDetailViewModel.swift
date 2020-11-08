//
//  StoryDetailViewModel.swift
//  HackerNews
//
//  Created by Kunal Tyagi on 08/11/20.
//

import Foundation
import Combine

class StoryDetailViewModel: ObservableObject {
    var cancellable: AnyCancellable?
    
    @Published private var story = Story.placeholder()
    
    func fetchStoryDetails(storyId: Int) {
        cancellable = Webservice().getStoryById(id: storyId)
            .catch { _ in Just(Story.placeholder()) }
            .sink(receiveCompletion: { _ in }, receiveValue: { story in
                self.story = story
            })
    }
}

extension StoryDetailViewModel {
    var title: String {
        return self.story.title
    }
    
    var url: String {
        return self.story.url
    }
}
