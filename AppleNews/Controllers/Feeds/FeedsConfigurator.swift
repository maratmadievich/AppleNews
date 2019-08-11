//
//  FeedsConfigurator.swift
//  AppleFeeds
//
//  Created by Admin on 8/8/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

protocol FeedsConfigurator {
	func configure(view: FeedsViewController)
}

class FeedsConfiguratorImpl: FeedsConfigurator  {
	
	func configure(view: FeedsViewController) {
		let router = FeedsRouterImpl(view: view)
		let model = FeedsModelImpl()
		let presenter = FeedsPresenterImpl(view: view,
										  model: model,
										  router: router)
		model.presenter = presenter
		view.presenter = presenter
	}
	
}
