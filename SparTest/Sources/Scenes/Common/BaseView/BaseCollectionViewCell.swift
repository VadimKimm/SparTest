//
//  BaseCollectionViewCell.swift
//  SparTest
//
//  Created by Vadim Kim on 16.08.2023.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func commonInit() {
        setupHierarchy()
        setupLayout()
        setupView()
    }

    func setupHierarchy() {}

    func setupLayout() {}

    func setupView() {}

}
