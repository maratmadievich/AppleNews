//
//  FeedDetailConfigurator.swift
//  AppleNews
//
//  Created by Марат Нургалиев on 08/08/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

protocol FeedDetailConfigurator {
	init(with link: String)
	func configure(view: FeedDetailViewController)
}

class FeedDetailConfiguratorImpl: FeedDetailConfigurator {
	private var link: String = ""
	
	required init(with link: String) {
		self.link = link
	}
	
	func configure(view: FeedDetailViewController) {
		let model = FeedDetailModelImpl(with: link)
		let presenter = FeedDetailPresenterImpl(view: view, model: model)
		model.presenter = presenter
		view.presenter = presenter
	}
	
}
