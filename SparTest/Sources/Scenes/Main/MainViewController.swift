//
//  MainViewController.swift
//  SparTest
//
//  Created by Vadim Kim on 14.08.2023.
//

import UIKit

final class MainViewController: UIViewController {

    private lazy var customView: MainView = {
        let customView = MainView()
        return customView
    }()

    // MARK: - Lifecycle

    override func loadView() {
        self.view = customView
    }
}
