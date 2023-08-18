//
//  ProductModel.swift
//  SparTest
//
//  Created by Vadim Kim on 18.08.2023.
//

import UIKit

struct ProductModel {
    let price: Double
    var promotionType: ProductPromotionType? = nil
    let image: String
}

enum ProductPromotionType {
    case superPrice(price: Double)
    case new

    var title: String {
        switch self {
        case .superPrice: return "Супер цена"
        case .new: return "Новинка"
        }
    }

    var color: UIColor {
        switch self {
        case .superPrice: return Colors.lightRed.color
        case .new: return Colors.lightPurple.color
        }
    }
}

extension ProductModel {
    static func createMockData() -> [ProductModel] {
        [
            ProductModel(price: 109.9, image: Images.Recommendations.productOne.rawValue),
            ProductModel(price: 219.9, image: Images.Recommendations.productTwo.rawValue),
            ProductModel(price: 159.9, promotionType: .new, image: Images.Recommendations.productThree.rawValue),
            ProductModel(price: 75.9, promotionType: .superPrice(price: 55.9), image: Images.Recommendations.productFour.rawValue),
            ProductModel(price: 109.9, promotionType: .superPrice(price: 105.9), image: Images.Recommendations.productFive.rawValue),
            ProductModel(price: 329.9, promotionType: .superPrice(price: 269.9), image: Images.Recommendations.productSix.rawValue),
        ]
    }

    static func createSweetMockData() -> [ProductModel] {
        [
            ProductModel(price: 199.9, image: Images.SweetMood.sweetProductOne.rawValue),
            ProductModel(price: 99.9, image: Images.SweetMood.sweetProductTwo.rawValue),
            ProductModel(price: 99.9, image: Images.SweetMood.sweetProductThree.rawValue),
            ProductModel(price: 149.9, image: Images.SweetMood.sweetProductFour.rawValue),
            ProductModel(price: 99.9, image: Images.SweetMood.sweetProductFive.rawValue),
            ProductModel(price: 99.9, image: Images.SweetMood.sweetProductSix.rawValue),
            ProductModel(price: 99.9, image: Images.SweetMood.sweetProductSeven.rawValue),
            ProductModel(price: 319.9, image: Images.SweetMood.sweetProductEight.rawValue),
        ]
    }
}
