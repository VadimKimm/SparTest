//
//  PromotionModel.swift
//  SparTest
//
//  Created by Vadim Kim on 16.08.2023.
//

import Foundation

struct PromotionModel {
    let image: String
}

extension PromotionModel {
    static func createMockData() -> [PromotionModel] {
        [
            PromotionModel(image: Images.Promotion.promotionOne.rawValue),
            PromotionModel(image: Images.Promotion.promotionTwo.rawValue),
            PromotionModel(image: Images.Promotion.promotionThree.rawValue),
            PromotionModel(image: Images.Promotion.promotionFour.rawValue),
            PromotionModel(image: Images.Promotion.promotionFive.rawValue),
            PromotionModel(image: Images.Promotion.promotionSix.rawValue),
            PromotionModel(image: Images.Promotion.promotionSeven.rawValue),
            PromotionModel(image: Images.Promotion.promotionEight.rawValue)
        ]
    }
}
