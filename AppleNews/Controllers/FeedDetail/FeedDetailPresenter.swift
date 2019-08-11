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
	func completeConfigureWebView()
}

class FeedDetailPresenterImpl: FeedDetailPresenter {
	
	private weak var view: FeedDetailView?
	private var model: FeedDetailModel!
	
	required init(view: FeedDetailView, model: FeedDetailModel) {
		self.view = view
		self.model = model
	}
	
	internal func completeConfigureWebView() {
		guard let urlRequest = model.getUrlRequest() else {
			view?.show(error: "Нет ссылки")
			return
		}
		view?.show(urlRequest: urlRequest)
		
	}
	
}
