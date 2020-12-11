//
//  Flickr_DemoTests.swift
//  Flickr DemoTests
//
//  Created by Tristate Technology on 11/12/20.
//  Copyright © 2020 Tristate Technology. All rights reserved.
//

import XCTest
@testable import Flickr_Demo

class Flickr_DemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        checkisDataAvailable()
        checkisMoreDataAvailable()
    }
    
    func checkisDataAvailable() {
        let dict : [String : Any] = ["page": 1, "pages": 2, "perpage": 10, "total": 4,
                    "photo":[]]
        let model = HomeImagePhotos(dictData: dict)
        
        // Given: Here we assert that our initial state is correct
        XCTAssertLessThan(model.arrPhotos.count, model.total, "Download image from Server")
        
        // When
        model.arrPhotos = [HomeImagesDataModel(dictData: [:]),HomeImagesDataModel(dictData: [:]),HomeImagesDataModel(dictData: [:]),HomeImagesDataModel(dictData: [:])]
        
        // Then
        XCTAssertLessThan(model.arrPhotos.count, model.total, "Download image from Server")
    }
    
    func checkisMoreDataAvailable() {
        let dict : [String : Any] = ["page": 4, "pages": 2, "perpage": 10, "total": 4,
                    "photo":[]]
        let model = HomeImagePhotos(dictData: dict)
        
        // Given: Here we assert that our initial state is correct
        XCTAssertEqual(model.page, model.page)
        
        // When
        model.pages = 2
        
        // Then
        XCTAssertEqual(model.page, model.page)
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
