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
	func show(urlRequest: URLRequest)
}

class FeedDetailViewController: UIViewController {
	private var webView = WKWebView()
	
	public var configurator: FeedDetailConfigurator!
	internal var presenter: FeedDetailPresenter!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		configurator.configure(view: self)
		configureWebView()
    }
	
	/// Настраивает WebView
	private func configureWebView() {
		view = webView
		presenter.completeConfigureWebView()
	}

}

extension FeedDetailViewController: FeedDetailView {
	
	func show(error: String) {
		webView.loadHTMLString(error, baseURL: nil)
	}
	
	func show(urlRequest: URLRequest) {
		webView.load(urlRequest)
	}
}

