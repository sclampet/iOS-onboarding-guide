//
//  HomeViewController.swift
//  Onboarding Guide
//
//  Created by Scott Clampet on 9/2/19.
//  Copyright © 2019 Scott Clampet. All rights reserved.
//

import UIKit

private let cellId = "cellId"
private let pages: [Page] = {
    return [
        Page(imageName: "page1", title: "Your adventure awaits!", bodyText: "We're here to help you make the most of the adventures that matter to you."),
        Page(imageName: "page2", title: "Your adventure awaits!", bodyText: "We're here to help you make the most of the adventures that matter to you."),
        Page(imageName: "page3", title: "Your adventure awaits!", bodyText: "We're here to help you make the most of the adventures that matter to you.")
    ]
}()

class HomeViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        navigationController?.navigationBar.isHidden = true
        setupScrolling()
    }
    
    func setupScrolling() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            collectionView.isPagingEnabled = true
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    // MARK: DataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    // MARK: DataSource
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
