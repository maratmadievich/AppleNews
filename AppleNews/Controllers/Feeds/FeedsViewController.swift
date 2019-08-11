//
//  FeedsViewController.swift
//  AppleFeeds
//
//  Created by Admin on 8/8/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

protocol FeedsView: class {
	func reloadFeeds()
}

class FeedsViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	private let refreshControl = UIRefreshControl()
	
	private var configurator = FeedsConfiguratorImpl()
	internal var presenter: FeedsPresenter!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		configurator.configure(view: self)
		configureViews()
		presenter.loadFeeds()
    }
	
	private func configureViews() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.tableFooterView = UIView(frame: CGRect.zero)
		refreshControl.addTarget(self, action: #selector(refreshFeeds(_:)), for: .valueChanged)
		tableView.refreshControl = refreshControl
	}
	
	@objc private func refreshFeeds(_ sender: Any) {
		presenter.loadFeeds()
	}
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		presenter.prepare(for: segue, sender: sender)
	}
}

extension FeedsViewController: FeedsView {
	
	func reloadFeeds() {
		refreshControl.endRefreshing()
		tableView.reloadData()
	}
}

extension FeedsViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter.FeedsCount
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as? FeedCellImpl else { return UITableViewCell() }
		cell.configure(with: presenter.getFeed(from: indexPath.row))
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		presenter.select(row: indexPath.row)
	}
	
	
	
}
