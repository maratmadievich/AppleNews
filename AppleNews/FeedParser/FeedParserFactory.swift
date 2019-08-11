//
//  FeedParserFactory.swift
//  AppleNews
//
//  Created by Марат Нургалиев on 08/08/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

class FeedParserFactory {
	
	func makeFeedParser() -> AbstractFeedParser {
		return FeedParser()
	}
}
