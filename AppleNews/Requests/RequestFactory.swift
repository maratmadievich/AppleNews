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
	
	func makeGetFeedsRequest() -> AbstractRequest {
		let urlString = "https://developer.apple.com/news/rss/news.rss"
		let method: HTTPMethod = .get
		let methodDescription = "feeds"
		return AlamofireRequest(urlString: urlString, method: method, methodDescription: methodDescription)
	}
	
	func makeFeedRequest(from link: String) -> AbstractRequest {
		let urlString = link
		let method: HTTPMethod = .get
		let methodDescription = "feed's link"
		return AlamofireRequest(urlString: urlString, method: method, methodDescription: methodDescription)
	}
	
}
