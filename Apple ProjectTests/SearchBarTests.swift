//
//  SearchBarTests.swift
//  Apple ProjectTests
//
//  Created by Laurence Wingo on 6/7/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import XCTest
@testable import Apple_Project

class SearchBarTests: XCTestCase {
    
    var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "initialViewController")
        sut = viewController as! ViewController
        _ = sut.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_SearchBarIsLoadedAfterViewDidLoad(){
        
        XCTAssertNotNil(sut.searchBar)
    }
    
    func test_LoadingView_SetsSearchBarDelegate(){
        XCTAssertTrue(sut.searchBar.delegate is ViewController)
    }
    
    func test_NumberOfSectionsInTableView_IsOne(){
        let numberOfSections = sut.tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func test_NumberOfElements_In_InitialCitiesArray_MatchesFilteredArrayForSearchBar(){
        sut.tableView.dataSource = sut
        XCTAssertEqual(sut.cities.count, sut.currentCitiesArray.count)
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
