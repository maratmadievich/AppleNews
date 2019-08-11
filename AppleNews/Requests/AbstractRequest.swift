//
//  RequestGetFeedsFactory.swift
//  AppleFeeds
//
//  Created by Admin on 8/8/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import Alamofire

protocol AbstractRequest {
	func request(completed: @escaping (Result<Data?>) -> Void)
}
