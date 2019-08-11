//
//  AppleNew.swift
//  AppleNews
//
//  Created by Admin on 8/8/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

class AppleFeed {
	var title = ""
	var link = ""
	var date = ""
	var description = ""
	
	init (title: String, link: String, date: String, description: String) {
		self.title = title
		self.link = link
		self.date = date
		self.description = description
	}
}
