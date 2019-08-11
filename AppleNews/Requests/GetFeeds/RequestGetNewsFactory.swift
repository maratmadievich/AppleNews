//
//  RequestGetFeedsFactory.swift
//  AppleFeeds
//
//  Created by Admin on 8/8/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

protocol RequestGetFeedsFactory {
	
	func getFeeds(completed: @escaping (ResponseResult<[AppleFeed]>) -> Void)
	
}
