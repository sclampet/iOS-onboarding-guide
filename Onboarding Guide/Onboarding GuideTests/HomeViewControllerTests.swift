//
//  Onboarding_GuideTests.swift
//  Onboarding GuideTests
//
//  Created by Scott Clampet on 9/2/19.
//  Copyright © 2019 Scott Clampet. All rights reserved.
//

import XCTest
@testable import Onboarding_Guide

class HomeViewControllerTests: XCTestCase {
    
    var homeController: HomeViewController!

    override func setUp() {
        super.setUp()
        homeController = HomeViewController()
    }

    override func tearDown() {
        homeController = nil
        super.tearDown()
    }
    
    func testSetHorizontalScrollSetup() {
        homeController.setupScrolling()
        if let layout = homeController.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            XCTAssertTrue(layout.scrollDirection == .horizontal)
        }
    }
    
    func testPageCellsRenderWithCorrectImageName() {
        let pages: [Page] = [Page(imageName: "page1", title: "Choose your adventure", bodyText: "We're here to help you make the most of the adventures that matter to you.")]
        let cell = PageCell()
        
        cell.page = pages[0]
        
        XCTAssertTrue(cell.imageView.image == UIImage(named: pages[0].imageName))
        
    }
    
    func testCollectionViewIsPagingEnabled() {
        XCTAssertTrue(homeController.collectionView.isPagingEnabled)
    }
    
    func testGoToNextPage() {
        let currentPage = homeController.pageControl.currentPage
        homeController.goToNextPage()
        
        XCTAssertTrue(homeController.pageControl.currentPage == currentPage + 1)
    }
    
//    func testSkipToLogin() {
//        homeController.skipToLogin()
//        
////        XCTAssertTrue(homeController.pageControl.currentPage == ho)
//    }
}
