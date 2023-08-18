//
//  MainViewController.swift
//  SparTest
//
//  Created by Vadim Kim on 14.08.2023.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Properties

    var adapter: MainCollectionViewAdapter?

    private lazy var customView: MainView = {
        let customView = MainView()
        return customView
    }()

    // MARK: - Lifecycle

    override func loadView() {
        self.view = customView
    }

    override func viewDidLoad() {
        setupCollectionViewAdapter()
    }

    // MARK: - Settings

    private func setupCollectionViewAdapter() {
        adapter = MainCollectionViewAdapter(collectionView: customView.collectionView)
        configureDataSourse()
    }

    private func configureDataSourse() {
        var dataSource: [MainSectionType: Any] = [:]
        dataSource[.stories] = StoryModel.createMockData()
        dataSource[.promotions] = PromotionModel.createMockData()
        dataSource[.bonus] = BonusModel.createMockData()
        dataSource[.mixed] = MixModel.createMockData()
        dataSource[.recommendations] = ProductModel.createMockData()
        dataSource[.sweetMood] = ProductModel.createSweetMockData()

        adapter?.configure(with: dataSource)
    }
}
