//
//  ResponseResult.swift
//  AppleNews
//
//  Created by Admin on 8/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

public enum ResponseResult<Value> {
	case success(Value)
	case failure(Error)
	
	public var isSuccess: Bool {
		switch self {
		case .success:
			return true
		case .failure:
			return false
		}
	}
	
	public var isFailure: Bool {
		return !isSuccess
	}
	
	public var value: Value? {
		switch self {
		case .success(let value):
			return value
		case .failure:
			return nil
		}
	}
	
	public var error: Error? {
		switch self {
		case .success:
			return nil
		case .failure(let error):
			return error
		}
	}
	
}
