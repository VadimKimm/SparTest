//
//  MainCollectionViewAdapter.swift
//  SparTest
//
//  Created by Vadim Kim on 15.08.2023.
//

import UIKit

final class MainCollectionViewAdapter: NSObject {

    // MARK: - Properties

    private var collectionView: UICollectionView

    // MARK: - Initialization

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        setupCollection()
    }

    // MARK: - Internal methods

    func configure() {
        collectionView.reloadData()
    }

    // MARK: - Private methods

    private func setupCollection() {
        collectionView.dataSource = self

        collectionView.register(
            StoryCollectionViewCell.self,
            forCellWithReuseIdentifier: StoryCollectionViewCell.identifier
        )
    }
}

extension MainCollectionViewAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return StoryModel.createMockData().count
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: StoryCollectionViewCell.identifier,
                for: indexPath
            ) as? StoryCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: StoryModel.createMockData()[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
