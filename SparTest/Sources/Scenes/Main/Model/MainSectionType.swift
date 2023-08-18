//
//  MainSectionType.swift
//  SparTest
//
//  Created by Vadim Kim on 18.08.2023.
//

import Foundation

enum MainSectionType: CaseIterable {
    case stories
    case promotions
    case bonus
    case mixed
    case recommendations
    case sweetMood

    var title: String {
        switch self {
        case .recommendations: return "Рекомендуем"
        case .sweetMood: return "Сладкое настроение"
        default: return ""
        }
    }
}
