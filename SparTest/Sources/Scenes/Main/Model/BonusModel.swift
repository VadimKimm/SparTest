//
//  BonusModel.swift
//  SparTest
//
//  Created by Vadim Kim on 16.08.2023.
//

import Foundation

struct BonusModel {
    let image: String
    let value: Int
}

extension BonusModel {
    static func createMockData() -> [BonusModel] {
        [BonusModel(image: "bonus", value: 123)]
    }
}
