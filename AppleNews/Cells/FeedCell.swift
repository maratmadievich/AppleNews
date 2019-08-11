//
//  FeedCell.swift
//  AppleNews
//
//  Created by Марат Нургалиев on 08/08/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

protocol FeedCell {
	func configure(with feed: AppleFeed)
}
class FeedCellImpl: UITableViewCell, FeedCell {
	
	@IBOutlet weak var labelTitle: UILabel!
	@IBOutlet weak var labelDate: UILabel!
	@IBOutlet weak var labelDescription: UILabel!

	func configure(with feed: AppleFeed) {
		labelTitle.text = feed.title
		labelDate.text = feed.date
		labelDescription.text = feed.description
	}

	

}
