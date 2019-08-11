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
	private let requestGetFeeds = RequestFactory().makeGetFeedsRequest()
	private let feedsParser = FeedsParserFactory().makeFeedsParser()
	
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
		requestGetFeeds.request() { [weak self] response in
			self?.parse(response: response)
		}
	}
	
	private func parse(response: Result<Data?>) {
		switch response {
		case .success(let feedsData):
			parseFeeds(from: feedsData)
		
		case .failure(let error):
			print(error.localizedDescription)
		}
	}
	
	private func parseFeeds(from data: Data?) {
		if let data = data {
			feedsParser.parseFeeds(from: data) { [weak self] feeds in
				self?.feeds = feeds
				self?.presenter?.handleShowFeeds()
			}
		} else {
			feeds.removeAll()
			presenter?.handleShowFeeds()
		}
	}

}
