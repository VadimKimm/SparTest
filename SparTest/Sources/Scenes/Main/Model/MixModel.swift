//
//  MixModel.swift
//  SparTest
//
//  Created by Vadim Kim on 16.08.2023.
//

import Foundation

struct MixModel {
    let title: String
    let image: String
}

extension MixModel {
    static func createMockData() -> [MixModel] {
        [
            MixModel(title: "Абонемент на кофе", image: Images.Mix.mixOne.rawValue),
            MixModel(title: "Мои скидки", image: Images.Mix.mixTwo.rawValue),
            MixModel(title: "Доставка за 1 час", image: Images.Mix.mixThree.rawValue),
            MixModel(title: "SPAR Wine", image: Images.Mix.mixFour.rawValue),
            MixModel(title: "Карта в подарок", image: Images.Mix.mixFive.rawValue),
            MixModel(title: "Списки покупок", image: Images.Mix.mixSix.rawValue),
            MixModel(title: "Доставка", image: Images.Mix.mixSeven.rawValue),
            MixModel(title: "Закажи и забери", image: Images.Mix.mixEight.rawValue),
            MixModel(title: "Чат поддержки", image: Images.Mix.mixNine.rawValue),
            MixModel(title: "Мои адреса", image: Images.Mix.mixTen.rawValue),
            MixModel(title: "Магазины рядом", image: Images.Mix.mixEleven.rawValue),
        ]
    }
}
