//
//  FeedDetailPresenter.swift
//  AppleNews
//
//  Created by Марат Нургалиев on 08/08/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

protocol FeedDetailPresenter: class {
	init(view: FeedDetailView, model: FeedDetailModel)
	func handleGet(error: String)
	func handleGet(feedDetail: String)
}

class FeedDetailPresenterImpl: FeedDetailPresenter {
	
	private weak var view: FeedDetailView?
	private var model: FeedDetailModel!
	
	required init(view: FeedDetailView, model: FeedDetailModel) {
		self.view = view
		self.model = model
	}
	
	internal func handleGet(error: String) {
		view?.show(error: error)
	}
	
	internal func handleGet(feedDetail: String) {
		view?.show(feedDetail: feedDetail)
	}
	
}
