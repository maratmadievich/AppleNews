//
//  HtmlParser.swift
//  AppleNews
//
//  Created by Марат Нургалиев on 11/08/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import Kanna

class HtmlParser: NSObject, AbstractHtmlParser {
	
	private var queue = DispatchQueue.global(qos: .background)
	
	internal func parseFeed(from data: Data, completed: @escaping(String?) -> ()) {
		queue.sync {
			var feedDetail: String? = nil
			if let htmlDoc = try? HTML(html: data, encoding: .utf8) {
				feedDetail = htmlDoc.xpath("/html/body//span[@class='article-text']").first?.text
			}
			DispatchQueue.main.async {
				completed(feedDetail)
			}
		}
	}
	
}

