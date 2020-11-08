//
//  Story.swift
//  HackerNews
//
//  Created by Kunal Tyagi on 08/11/20.
//

import Foundation

struct Story: Decodable {
    let id: Int
    let title: String
    let url: String
}

extension Story {
    static func placeholder()-> Story {
        return Story(id: 0, title: "N/A", url: "")
    }
}
