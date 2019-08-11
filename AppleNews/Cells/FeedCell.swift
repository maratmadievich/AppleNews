//
//  FeedCell.swift
//  AppleNews
//
//  Created by Марат Нургалиев on 08/08/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

protocol FeedCell {
	func setDate(text: String)
	func setTitle(text: String)
	func setDescription(text: String)
}
class FeedCellImpl: UITableViewCell, FeedCell {
	
	@IBOutlet weak var labelTitle: UILabel!
	@IBOutlet weak var labelDate: UILabel!
	@IBOutlet weak var labelDescription: UILabel!
	
	func setDate(text: String) {
		labelTitle.text = text
	}
	
	func setTitle(text: String) {
		labelDate.text = text
	}
	
	func setDescription(text: String) {
		labelDescription.text = text
	}
	
}
