//
//  FeedsRouter.swift
//  AppleFeeds
//
//  Created by Admin on 8/8/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

protocol FeedsRouter {
	init (view: FeedsViewController)
	func showFeedsDetail(by link: String)
	func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

class FeedsRouterImpl: FeedsRouter {
	
	fileprivate weak var view: FeedsViewController?
	
	required init (view: FeedsViewController) {
		self.view = view
	}
	
	func showFeedsDetail(by link: String) {
		view?.performSegue(withIdentifier: "showFeedsDetail", sender: link)
	}
	
	public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		switch segue.identifier {
		case "showFeedsDetail":
			guard let upcoming = segue.destination as? FeedDetailViewController,
				let link = sender as? String else { return }
			let configurator = FeedDetailConfiguratorImpl(with: link)
			upcoming.configurator = configurator
			
		default:
			return
		}
		
		let backItem = UIBarButtonItem()
		backItem.title = ""
		view?.navigationItem.backBarButtonItem = backItem
	}
	
}

