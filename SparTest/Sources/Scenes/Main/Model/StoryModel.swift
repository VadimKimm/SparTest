//
//  StoryModel.swift
//  SparTest
//
//  Created by Vadim Kim on 15.08.2023.
//

import Foundation

struct StoryModel {
    let title: String
    let image: String
}

extension StoryModel {
    static func createMockData() -> [StoryModel] {
        [
            StoryModel(title: "Привелегии \"Мой SPAR\"", image: Images.Story.storyOne.rawValue),
            StoryModel(title: "Мы в соцсетях", image: Images.Story.storyTwo.rawValue),
            StoryModel(title: "KLERN", image: Images.Story.storyThree.rawValue),
            StoryModel(title: "Медовый спас", image: Images.Story.storyFour.rawValue),
            StoryModel(title: "Новинки недели", image: Images.Story.storyFive.rawValue),
            StoryModel(title: "Рецепт недели", image: Images.Story.storySix.rawValue),
            StoryModel(title: "Конкурсы в соцсетях", image: Images.Story.storySeven.rawValue),
            StoryModel(title: "Городецкая роспись", image: Images.Story.storyEight.rawValue),
        ]
    }
}
