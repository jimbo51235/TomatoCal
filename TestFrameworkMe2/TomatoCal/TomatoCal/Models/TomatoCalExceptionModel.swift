//
//  TomatoCalExceptionModel.swift
//  CalendarMania2
//
//  Created by Tomato on 2021/10/17.
//

import Foundation

public struct TomatoCalExceptionModel {
	let year: Int
	let month: Int
	let dayOfMonth: Int
	
	public init(year: Int, month: Int, dayOfMonth: Int) {
		self.year = year
		self.month = month
		self.dayOfMonth = dayOfMonth
	}
}

