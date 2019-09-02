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
        homeController = HomeViewController(collectionViewLayout: UICollectionViewFlowLayout())
    }

    override func tearDown() {
        homeController = nil
        super.tearDown()
    }
    
    func testSetHorizontalScrollSetup() {
        homeController.setupScrolling()
        if let layout = homeController.collectionViewLayout as? UICollectionViewFlowLayout {
            XCTAssertTrue(layout.scrollDirection == .horizontal)
        }
    }
}
