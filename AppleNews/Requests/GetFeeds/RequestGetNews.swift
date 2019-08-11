//
//  RequestGetFeeds.swift
//  AppleFeeds
//
//  Created by Admin on 8/8/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import Alamofire

class RequestGetFeeds {
	public let urlString: String
	public let method: HTTPMethod
	public let methodDescription: String
	
	required init(urlString: String, method: HTTPMethod, methodDescription: String) {
		self.urlString = urlString
		self.method = method
		self.methodDescription = methodDescription
	}
	
}

extension RequestGetFeeds: RequestGetFeedsFactory {
	
	func getFeeds(completed: @escaping (ResponseResult<[AppleFeed]>) -> Void) {
		Alamofire.request(urlString, method: method, parameters: nil)
			.response { response in
				if let data = response.data {
					let feedParser = FeedParserFactory().makeFeedParser()
					completed(ResponseResult.success(feedParser.parseFeeds(from: data)))
				}
				else if let error = response.error {
					completed(ResponseResult.failure(error))
				}
				else {
					completed(ResponseResult.success([]))
				}
		}
	}
	
}



