//
//  GetNewsTest.swift
//  AppleNewsTests
//
//  Created by Admin on 8/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import XCTest
@testable import AppleNews

class GetNewsTest: XCTestCase {
	
	let expectation = XCTestExpectation(description: "Тестирование получение новостей")
	var requestFactory: RequestFactory!

    override func setUp() {
        requestFactory = RequestFactory()
    }

    override func tearDown() {
       requestFactory = nil
    }

	/// Тест на получение данных от сервера
	func testGetFeeeds() {
		let requestGetFeeds = requestFactory.makeGetFeedsRequest()
		requestGetFeeds.request { [weak self] response in
			if response.isFailure {
				XCTFail("GetNewsTests Error: \(response.error!.localizedDescription)")
			}
			self?.expectation.fulfill()
		}
		wait(for: [expectation], timeout: 10.0)
	}

}
