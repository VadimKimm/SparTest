//
//  MainView.swift
//  SparTest
//
//  Created by Vadim Kim on 14.08.2023.
//

import UIKit

final class MainView: UIView {

    // MARK: - Views

    private let navigationBar = CustomNavigationBar()

    // MARK: - Settings

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        setupHierarchy()
        setupLayout()
        setupView()
    }

    // MARK: - Private functions

    private func setupHierarchy() {
        addSubview(navigationBar)
    }

    private func setupLayout() {
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.navigationBarTopOffset),
            navigationBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func setupView() {
        backgroundColor = Colors.white.color
    }
}

// MARK: - Metrics

extension MainView {
    enum Metrics {
        static let navigationBarTopOffset: CGFloat = 55
    }
}
