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
        sut.tableView.dataSource = sut
        sut.searchBar.delegate = sut
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
    
    func testSUT_ConformsToSearchBarDelegateProtocol() {
        XCTAssert(sut.conforms(to: UISearchBarDelegate.self))
        XCTAssertTrue(self.sut.responds(to: #selector(sut.searchBar(_:textDidChange:))))
        
    }
    
    func test_NumberOfSectionsInTableView_IsOne(){
        let numberOfSections = sut.tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func test_NumberOfElements_In_InitialCitiesArray_MatchesAlphabeticallySortedArrayElements(){
        XCTAssertEqual(sut.alphabeticallySortedCities.count, sut.downloadedCities.count)
    }
    
    func test_NumberOfElements_with_Atlanta_Typed_In_SearchBar(){
        sut.searchBar(sut.searchBar, textDidChange: "Atlanta")
        XCTAssertEqual(sut.alphabeticallySortedCities.count, 4)
        XCTAssertEqual(sut.alphabeticallySortedCities[0]._id, 4180439)
    }
    
    func test_NumberOfElements_with_Denver_Typed_In_SearchBar(){
        sut.searchBar(sut.searchBar, textDidChange: "Denver")
        XCTAssertEqual(sut.alphabeticallySortedCities.count, 7)
        XCTAssertEqual(sut.alphabeticallySortedCities[4]._id, 4853799)
    }
    
    func test_NumberOfElements_with_Invalid_Element_Typed_In_SearchBar(){
        sut.searchBar(sut.searchBar, textDidChange: "Califoric")
        XCTAssertTrue(sut.alphabeticallySortedCities.isEmpty)
    }
    
}
