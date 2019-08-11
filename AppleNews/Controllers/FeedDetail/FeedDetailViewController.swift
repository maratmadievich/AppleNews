//
//  FeedDetailViewController.swift
//  AppleNews
//
//  Created by Марат Нургалиев on 08/08/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import WebKit

protocol FeedDetailView: class {
	func show(error: String)
	func show(feedDetail: String)
}

class FeedDetailViewController: UIViewController {
	@IBOutlet weak var textView: UITextView!
	
	public var configurator: FeedDetailConfigurator!
	internal var presenter: FeedDetailPresenter!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		configurator.configure(view: self)
    }
	
}

extension FeedDetailViewController: FeedDetailView {
	
	func show(error: String) {
		textView.textColor = .red
		textView.text = error
	}
	
	func show(feedDetail: String) {
		textView.textColor = .darkText
		textView.text = feedDetail
	}
}

