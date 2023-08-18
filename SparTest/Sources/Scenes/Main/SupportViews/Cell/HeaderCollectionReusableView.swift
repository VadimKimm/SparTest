//
//  HeaderCollectionReusableView.swift
//  SparTest
//
//  Created by Vadim Kim on 17.08.2023.
//

import UIKit

final class HeaderCollectionReusableView: UICollectionReusableView {

    // MARK: - Configuration

    func configure(with text: String) {
        titleLabel.text = text
    }

    //MARK: - Properties

    static let identifier = String(describing: HeaderCollectionReusableView.self)

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

    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }

    private func setupView() {
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = Colors.black.color
    }
}
