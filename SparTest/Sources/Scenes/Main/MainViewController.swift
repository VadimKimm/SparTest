//
//  MainViewController.swift
//  SparTest
//
//  Created by Vadim Kim on 14.08.2023.
//

import UIKit

protocol MainViewInput: AnyObject {
    func reload(with dataSourse: [MainSectionType: Any])
}

final class MainViewController: UIViewController {

    // MARK: - Properties

    var output: MainViewOutput?
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
        output?.viewDidLoad()
    }

    // MARK: - Settings

    private func setupCollectionViewAdapter() {
        adapter = MainCollectionViewAdapter(collectionView: customView.collectionView)
    }
}

// MARK: - MainViewInput

extension MainViewController: MainViewInput {
    func reload(with dataSourse: [MainSectionType: Any]) {
        adapter?.configure(with: dataSourse)
    }
}
