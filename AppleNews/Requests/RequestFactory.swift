//
//  RequestFactory.swift
//  AppleNews
//
//  Created by Admin on 8/8/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import Alamofire

class RequestFactory {
	
	func makeGetNewsFactory() -> RequestGetFeedsFactory {
		let urlString = "https://developer.apple.com/news/rss/news.rss"
		let method: HTTPMethod = .get
		let methodDescription = "news"
		return RequestGetFeeds(urlString: urlString, method: method, methodDescription: methodDescription)
	}
	
}
