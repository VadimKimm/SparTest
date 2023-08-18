//
//  MainPresenter.swift
//  SparTest
//
//  Created by Vadim Kim on 18.08.2023.
//

import Foundation

protocol MainViewOutput: AnyObject {
    func viewDidLoad()
}

final class ProfilePresenter: MainViewOutput {

    // MARK: - Properties

    private weak var view: MainViewInput?
    private var dataSource: [MainSectionType: Any] = [:]

    // MARK: - Internal methods

    init(view: MainViewInput) {
        self.view = view
    }

    func viewDidLoad() {
        dataSource[.stories] = StoryModel.createMockData()
        dataSource[.promotions] = PromotionModel.createMockData()
        dataSource[.bonus] = BonusModel.createMockData()
        dataSource[.mixed] = MixModel.createMockData()
        dataSource[.recommendations] = ProductModel.createMockData()
        dataSource[.sweetMood] = ProductModel.createSweetMockData()
        view?.reload(with: dataSource)
    }
}
