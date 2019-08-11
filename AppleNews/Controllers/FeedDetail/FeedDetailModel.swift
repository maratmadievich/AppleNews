//
//  FeedDetailModel.swift
//  AppleNews
//
//  Created by Марат Нургалиев on 08/08/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import Alamofire

protocol FeedDetailModel {
	init(with link: String)
	var presenter: FeedDetailPresenter? { get set }
}

class FeedDetailModelImpl: FeedDetailModel {
	
	internal weak var presenter: FeedDetailPresenter?
	private let requestFeedDetail: AbstractRequest?
	private let feedParser = FeedsParserFactory().makeFeedParser()
	
	private var link: String = ""
	
	required init(with link: String) {
		self.link = link
		requestFeedDetail = RequestFactory().makeFeedRequest(from: link)
		getFeedDetail()
	}
	
	private func getFeedDetail() {
		guard let requestFeedDetail = requestFeedDetail else {
			presenter?.handleGet(error: "Ошибка: Отсутствует парсер")
			return }
		requestFeedDetail.request() { [weak self] response in
			self?.parse(response: response)
		}
	}
	
	private func parse(response: Result<Data?>) {
		switch response {
		case .success(let feedData):
			parseFeedDetail(from: feedData)
			
		case .failure(let error):
			presenter?.handleGet(error: "Ошибка: \(error.localizedDescription)")
		}
	}
	
	private func parseFeedDetail(from data: Data?) {
		guard let data = data else {
			presenter?.handleGet(error: "Ошибка: Отсутствуют данные")
			return
		}
		feedParser.parseFeed(from: data) { [weak self] detail in
			if let detail = detail {
				self?.presenter?.handleGet(feedDetail: detail)
			} else {
				self?.presenter?.handleGet(error: "Ошибка: Не удалось распарсить новость")
			}
		}
	}
	
}
