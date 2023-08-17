//
//  HeaderCollectionReusableView.swift
//  SparTest
//
//  Created by Vadim Kim on 17.08.2023.
//

import UIKit

final class HeaderCollectionReusableView: UICollectionReusableView {

    // MARK: - Views

    private let titleLabel = UILabel()

    // MARK: - Settings

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupHierarchy()
        setupLayout()
        setupView()
    }

    // MARK: - Private functions

    private func setupHierarchy() {
        addSubview(titleLabel)
    }

    private func setupLayout() {}

    private func setupView() {}
}
