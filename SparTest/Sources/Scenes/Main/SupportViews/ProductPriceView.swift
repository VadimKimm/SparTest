//
//  ProductPriceView.swift
//  SparTest
//
//  Created by Vadim Kim on 18.08.2023.
//

import UIKit

final class ProductPriceView: UIView {

    // MARK: - Configuration

    func configure(with model: ProductModel) {
        priceLabel.text =  String(format: "%.2f", model.price)

        guard case let .superPrice(newPrice) = model.promotionType else {
            promotionPriceLabel.isHidden = true
            return
        }

        promotionPriceLabel.attributedText = NSAttributedString(
            string: String(format: "%.2f", newPrice),
            attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
        )
    }

    // MARK: - Views

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private lazy var priceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()

    private lazy var currencyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rubIcon")
        imageView.clipsToBounds = true
        return imageView
    }()

    private let priceLabel = UILabel()
    private let promotionPriceLabel = UILabel()

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
        addSubview(mainStackView)

        mainStackView.addArrangedSubview(priceStackView)
        mainStackView.addArrangedSubview(promotionPriceLabel)

        priceStackView.addArrangedSubview(priceLabel)
        priceStackView.addArrangedSubview(currencyImageView)
    }

    private func setupLayout() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        currencyImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currencyImageView.heightAnchor.constraint(equalToConstant: Metrics.currenyImageViewHeight),
            currencyImageView.widthAnchor.constraint(equalToConstant: Metrics.currenyImageViewHeight)
        ])
    }

    private func setupView() {
        priceLabel.font = .systemFont(ofSize: 15, weight: .bold)
        priceLabel.textColor = Colors.black.color

        promotionPriceLabel.font = .systemFont(ofSize: 13)
        promotionPriceLabel.textColor = Colors.darkGray.color
    }
}

// MARK: - Metrics

private extension ProductPriceView {
    enum Metrics {
        static let currenyImageViewHeight: CGFloat = 25
    }

    enum Strings {
        static let locationTitle = "Москва, Москва и Московская область"
    }
}
