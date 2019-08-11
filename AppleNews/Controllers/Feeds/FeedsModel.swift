//
//  FeedsModel.swift
//  AppleFeeds
//
//  Created by Admin on 8/8/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import Alamofire

protocol FeedsModel {
	var presenter: FeedsPresenter? { get set }
	var feedsCount: Int { get }
	func loadFeeds()
	func getFeed(from row: Int) -> AppleFeed
	func getLink(from row: Int) -> String
}

class FeedsModelImpl: NSObject, FeedsModel {
	internal weak var presenter: FeedsPresenter?
	
	private var feeds: [AppleFeed] = []
	
	var feedsCount: Int {
		return feeds.count
	}
	
	internal func getFeed(from row: Int) -> AppleFeed {
		return feeds[row]
	}
	
	internal func getLink(from row: Int) -> String {
		return feeds[row].link
	}
	
	internal func loadFeeds() {
		let request = RequestFactory().makeGetNewsFactory()
		request.getFeeds() { [weak self] response in
			self?.parseFeeds(from: response)
		}
	}
	
	private func parseFeeds(from response: ResponseResult<[AppleFeed]>) {
		switch response {
		case .success(let newFeeds):
			feeds = newFeeds
			presenter?.handleShowFeeds()
		
		case .failure(let error):
			print(error.localizedDescription)
			/// Вставить код по получению данных из CoreData
		}
	}

}
