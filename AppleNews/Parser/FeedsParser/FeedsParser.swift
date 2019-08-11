//
//  XMLParser.swift
//  AppleNews
//
//  Created by Марат Нургалиев on 08/08/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

class FeedsParser: NSObject, AbstractFeedsParser {
	
	private var parser = XMLParser()
	private var feeds: [AppleFeed] = []
	private var queue = DispatchQueue.global(qos: .background)
	
	let formatter = DateFormatter()
	let dateFormatInput = "EEE, dd MMM yyyy HH:mm:ss"
	let dateFormatOutput = "MMMM dd, yyyy"
	
	private var feedElement = String()
	private var feedTitle = String()
	private var feedLink = String()
	private var feedDate = String()
	private var feedDescription = String()
	
	private var inElement = false
	

	internal func parseFeeds(from data: Data, completed: @escaping([AppleFeed]) -> ()) {
		queue.sync { [weak self] in
			self?.feeds.removeAll()
			self?.parser = XMLParser(data: data)
			self?.parser.delegate = self
			self?.parser.parse()
			DispatchQueue.main.async { [weak self] in
				guard let feeds = self?.feeds else {
					completed([])
					return
				}
				completed(feeds)
			}
		}
	}
	
}

extension FeedsParser: XMLParserDelegate {
	
	func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
		if elementName == "item" {
			inElement = true
			feedLink = ""
			feedTitle = ""
			feedDate = ""
			feedDescription = ""
		}
		feedElement = elementName
	}
	
	func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
		if elementName == "item" {
			inElement = false
			feeds.append(AppleFeed(title: feedTitle, link: feedLink, date: feedDate, description: feedDescription))
		}
	}
	
	func parser(_ parser: XMLParser, foundCharacters string: String) {
		let value = string.trimmingCharacters(in: .whitespacesAndNewlines)
		
		if inElement && !value.isEmpty {
			switch feedElement {
			case "link":
				feedLink += value
				
			case "description":
				feedDescription += value
				
			case "title":
				feedTitle += value
				
			case "pubDate":
				feedDate = parseDate(from: value)
				
			default:
				break
			}
		}
	}
	
	private func parseDate(from value: String) -> String {
		var stringDate = value
		if stringDate.isEmpty {
			return "no Date"
		}
		stringDate.removeLast(4)
		formatter.dateFormat = dateFormatInput
		guard let date = formatter.date(from: stringDate) else {
			return "no Date"
		}
		formatter.dateFormat = dateFormatOutput
		return formatter.string(from: date)
	}
	
}


