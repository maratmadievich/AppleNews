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
		let getNewsRequest = requestFactory.makeGetNewsFactory()
		getNewsRequest.getFeeds { [weak self] response in
			switch response {
			case .success(let feeds):
				self?.checkFeedsCount(feeds)
				self?.checkFeedsFields(feeds)
				
			case .failure(let error):
				XCTFail("GetNewsTests Error: \(error.localizedDescription)")
			}
			self?.expectation.fulfill()
		}
		wait(for: [expectation], timeout: 10.0)
	}
	
	/// Проверка количества новостей
	/// Так как не реализован офлайн режим, одним из критериев проверки
	/// является получение непустого списка новостей
	private func checkFeedsCount(_ feeds: [AppleFeed]) {
		if feeds.isEmpty {
			XCTFail("GetNewsTests Error: returned empty Feeds array")
		}
	}
	
	/// Проверка заполненности полей
	private func checkFeedsFields(_ feeds: [AppleFeed]) {
		if !feeds.filter({ $0.date.contains("no Date")
			|| $0.description.isEmpty
			|| $0.link.isEmpty
			|| $0.title.isEmpty }).isEmpty {
			XCTFail("GetNewsTests Error: Some data in Feed is Empty")
		}
	}

}
