//
//  HomeViewController.swift
//  Onboarding Guide
//
//  Created by Scott Clampet on 9/2/19.
//  Copyright © 2019 Scott Clampet. All rights reserved.
//

import UIKit

private let cellId = "cellId"
private let loginCellId = "loginCellId"

class HomeViewController: UIViewController {
    
    let pages: [Page] = {
        return [
            Page(imageName: "page1", title: "Choose your adventure", bodyText: "We're here to help you make the most of the adventures that matter to you."),
            Page(imageName: "page2", title: "Document your experience", bodyText: "We'll help make sure you never forget this."),
            Page(imageName: "page3", title: "Explore new opportunities", bodyText: "Relax and reminisce about what a great decision you've made.")
        ]
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .black
        return cv
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = .white
        pc.numberOfPages = self.pages.count + 1
        return pc
    }()
    
    lazy var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(skipToLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(goToNextPage), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        navigationController?.navigationBar.isHidden = true
        
        registerCollectionViewCells()
        setupScrolling()
        setupViews()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count + 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == pages.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCellId, for: indexPath)
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    // MARK: Delagate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension HomeViewController {
    //MARK: Scroll Methods
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        
        fadeControlsAway()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}

extension HomeViewController {
    //MARK: Helper Methods
    func setupScrolling() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    func setupViews() {
        observeKeyboardNotifications()
        view.addSubview(collectionView)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        view.addSubview(pageControl)
        
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        
        view.addConstraintsWithFormat(format: "V:[v0(100)]|", views: pageControl)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: pageControl)
        
        view.addConstraintsWithFormat(format: "V:|-16-[v0(100)]", views: skipButton)
        view.addConstraintsWithFormat(format: "H:|-30-[v0]", views: skipButton)
        
        view.addConstraintsWithFormat(format: "V:|-16-[v0(100)]", views: nextButton)
        view.addConstraintsWithFormat(format: "H:[v0]-30-|", views: nextButton)
    }
    
    func registerCollectionViewCells() {
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(LoginCell.self, forCellWithReuseIdentifier: loginCellId)
    }
    
    //MARK: Skip and Next Button Methods
    @objc func goToNextPage() {
        if pageControl.currentPage == pages.count {
            return
        }
        
        if pageControl.currentPage == pages.count - 1 {
            fadeControlsAway()
        }
        
        let indexPath = IndexPath(item: pageControl.currentPage + 1, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage += 1
    }
    
    @objc func skipToLogin() {
        pageControl.currentPage = pages.count - 1
        goToNextPage()
    }
    
    //MARK: Fade Control Buttons Out
    fileprivate func fadeControlsAway() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.pageControl.alpha = self.pageControl.currentPage == self.pages.count ? 0 : 1
            self.skipButton.alpha =  self.pageControl.currentPage == self.pages.count ? 0 : 1
            self.nextButton.alpha =  self.pageControl.currentPage == self.pages.count ? 0 : 1
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    //MARK: Keyboard Observers
    fileprivate func observeKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardShow() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: -150, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    
    @objc func keyboardHide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
}
