//
//  ProductCollectionViewCell.swift
//  SparTest
//
//  Created by Vadim Kim on 16.08.2023.
//


import UIKit

final class ProductCollectionViewCell: BaseCollectionViewCell {

    // MARK: - Configuration

    func configure(with model: ProductModel) {
        imageView.image = UIImage(named: model.image)
        priceView.configure(with: model)

        guard let promotionType = model.promotionType else {
            promotionTitleView.isHidden = true
            return
        }
        promotionTitle.text = promotionType.title
        promotionTitleView.backgroundColor = promotionType.color
    }

    //MARK: - Properties

    static let identifier = String(describing: ProductCollectionViewCell.self)

    // MARK: - Views

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        return stackView
    }()

    private lazy var priceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var cartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cartIcon"), for: .normal)
        return button
    }()

    private let promotionTitleView = UIView()
    private let promotionTitle = UILabel()
    private let priceView = ProductPriceView()

    // MARK: - Settings

    override func setupHierarchy() {
        addSubview(stackView)
        addSubview(promotionTitleView)

        promotionTitleView.addSubview(promotionTitle)

        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(priceStackView)

        priceStackView.addArrangedSubview(priceView)
        priceStackView.addArrangedSubview(cartButton)
    }

    override func setupLayout() {
        promotionTitleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            promotionTitleView.topAnchor.constraint(equalTo: topAnchor),
            promotionTitleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.promotionTitleViewSideOffset),
            promotionTitleView.heightAnchor.constraint(equalTo: promotionTitle.heightAnchor, constant: Metrics.promotionTitleViewHeightOffset),
            promotionTitleView.widthAnchor.constraint(equalTo: promotionTitle.widthAnchor, constant: Metrics.promotionTitleViewWidthOffset)
        ])

        promotionTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            promotionTitle.topAnchor.constraint(equalTo: promotionTitleView.topAnchor),
            promotionTitle.leadingAnchor.constraint(equalTo: promotionTitleView.leadingAnchor, constant: Metrics.promotionTitleSideOffset)
        ])


        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.stackViewOffset),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.stackViewOffset),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.stackViewOffset),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.stackViewOffset)
        ])

        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: widthAnchor, constant: Metrics.imageViewWidthOffset)
        ])

        cartButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cartButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: Metrics.cartButtonWidthMultiplier),
            cartButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Metrics.cartButtonWidthMultiplier)
        ])
    }

    override func setupView() {
        backgroundColor = Colors.white.color

        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = Metrics.layerShadowRadius
        layer.shadowColor = Colors.black.cgColor
        layer.shadowOpacity = 0.3
        layer.cornerRadius = Metrics.cornerRadius

        promotionTitleView.layer.cornerRadius = Metrics.promotionTitleViewCornerRadius

        promotionTitle.font = .systemFont(ofSize: 10)
        promotionTitle.textColor = Colors.white.color
    }

    override func prepareForReuse() {
        promotionTitle.text = nil
        promotionTitleView.backgroundColor = nil
        promotionTitleView.isHidden = false
    }
}

// MARK: - Metrics

private extension ProductCollectionViewCell {
    enum Metrics {
        static let layerShadowRadius: CGFloat = 5
        static let cornerRadius: CGFloat = 15
        static let stackViewOffset: CGFloat = 5

        static let promotionTitleViewCornerRadius: CGFloat = 8
        static let promotionTitleViewHeightOffset: CGFloat = 5
        static let promotionTitleViewWidthOffset: CGFloat = 10
        static let promotionTitleViewSideOffset: CGFloat = 5
        static let promotionTitleSideOffset: CGFloat = 5

        static let imageViewWidthOffset: CGFloat = -20
        static let cartButtonWidthMultiplier: CGFloat = 1/3.7
    }
}
