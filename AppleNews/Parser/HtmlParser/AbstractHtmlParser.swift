//
//  AbstractHtmlParser.swift
//  AppleNews
//
//  Created by Марат Нургалиев on 11/08/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

protocol AbstractHtmlParser {
	func parseFeed(from data: Data, completed: @escaping(String?) -> ())
}
