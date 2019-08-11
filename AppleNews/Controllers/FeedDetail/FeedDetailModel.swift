//
//  FeedDetailModel.swift
//  AppleNews
//
//  Created by Марат Нургалиев on 08/08/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

protocol FeedDetailModel {
	init(with link: String)
	func getUrlRequest() -> URLRequest?
}

class FeedDetailModelImpl: FeedDetailModel {
	private var link: String = ""
	
	required init(with link: String) {
		self.link = link
	}
	
	internal func getUrlRequest() -> URLRequest? {
		guard let url = URL(string: link)else { return nil }
		return URLRequest(url: url)
	}
}
