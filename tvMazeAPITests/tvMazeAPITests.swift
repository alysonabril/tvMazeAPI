//
//  tvMazeAPITests.swift
//  tvMazeAPITests
//
//  Created by Alyson Abril on 10/8/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import XCTest
@testable import tvMazeAPI
class tvMazeAPITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testModelFromJson() {
        guard let path = Bundle.main.path(forResource: "shows", ofType: "json") else {
            print("No Path")
            return}
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let showsArray = try SearchShow.getShow(fromData: data)
            XCTAssert(showsArray.count > 0, "we have \(showsArray.count) shows")
        } catch {
            print(error)
        }
    }

}
