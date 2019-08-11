//
//  RequestGetFeeds.swift
//  AppleFeeds
//
//  Created by Admin on 8/8/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireRequest {
	public let urlString: String
	public let method: HTTPMethod
	public let methodDescription: String
	
	required init(urlString: String, method: HTTPMethod, methodDescription: String) {
		self.urlString = urlString
		self.method = method
		self.methodDescription = methodDescription
	}
	
}

extension AlamofireRequest: AbstractRequest {
	
	func request(completed: @escaping (Result<Data?>) -> Void) {
		Alamofire.request(urlString, method: method, parameters: nil)
			.response { response in
				if let error = response.error {
					completed(Result.failure(error))
				} else {
					completed(Result.success(response.data))
				}
		}
	}
	
}



