//
//  FeedsPresenter.swift
//  AppleFeeds
//
//  Created by Admin on 8/8/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

protocol FeedsPresenter: class {
	init(view: FeedsView, model: FeedsModel, router: FeedsRouter)
	var FeedsCount: Int { get }
	func loadFeeds()
	func select(row: Int)
	func handleShowFeeds()
	func getFeed(from row: Int) -> AppleFeed
	
	func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

class FeedsPresenterImpl: FeedsPresenter {
	
	private weak var view: FeedsView?
	private var model: FeedsModel!
	private var router: FeedsRouter!
	
	var FeedsCount: Int {
		get {
			return model.feedsCount
		}
	}
	
	required init(view: FeedsView, model: FeedsModel, router: FeedsRouter) {
		self.view = view
		self.model = model
		self.router = router
	}
	
	internal func loadFeeds() {
		model.loadFeeds()
	}
	
	internal func select(row: Int) {
		router.showFeedsDetail(by: model.getLink(from: row))
	}
	
	internal func handleShowFeeds() {
		guard let view = view else { return }
		view.reloadFeeds()
	}
	
	internal func getFeed(from row: Int) -> AppleFeed  {
		return model.getFeed(from: row)
	}
	
	internal func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		router.prepare(for: segue, sender: sender)
	}
}


