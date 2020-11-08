//
//  Webservice.swift
//  HackerNews
//
//  Created by Kunal Tyagi on 01/11/20.
//

import Foundation
import Combine

struct Webservice {
    func getAllTopStories()-> AnyPublisher<[Story], Error> {
        guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty") else { fatalError("Invalid Url") }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map { $0.data }
            .decode(type: [Int].self, decoder: JSONDecoder())
            .flatMap { storyIds in
                self.mergeStories(storyIds: storyIds)
            }
            .scan([], { (stories, story) -> [Story] in
                stories + [story]
            })
            .eraseToAnyPublisher()
    }
    
    func getStoryById(id: Int)-> AnyPublisher<Story, Error> {
        guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/item/\(id).json?print=pretty") else { fatalError("Invalid Url") }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map { $0.data }
            .decode(type: Story.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    private func mergeStories(storyIds: [Int])-> AnyPublisher<Story, Error> {
        let storyIds = Array(storyIds.prefix(50))
        let initialPublisher = getStoryById(id: storyIds[0])
        let remainder = Array(storyIds.dropFirst())
        
        return remainder.reduce(initialPublisher) { (combined, id) in
            combined.merge(with: getStoryById(id: id)).eraseToAnyPublisher()
        }
    }
}
