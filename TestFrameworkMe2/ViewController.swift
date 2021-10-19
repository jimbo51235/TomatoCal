//
//  ViewController.swift
//  TestFrameworkMe2
//
//  Created by Tomato on 2021/10/15.
//

import UIKit
import TomatoCal

class ViewController: UIViewController, TomatoCalDelegate {
	// MARK: - Variables
	let tomatoCalendar = TomatoCal()
	var currentYear: Int = 2021
	var currentMonth: Int = 10
	
	
	// MARK: - IBOutlet
	
	
	// MARK: - IBAction
	@IBAction func previousTapped(_ sender: UIButton) {
		if currentMonth == 1 {
			currentYear -= 1
			currentMonth = 12
		} else {
			currentMonth -= 1
		}
		tomatoCalendar.changeDaysOfMonth(myYear: currentYear, myMonth: currentMonth)
		print("Year: \(currentYear) Month: \(currentMonth)")
	}
	
	@IBAction func nextTapped(_ sender: UIButton) {
		if currentMonth == 12 {
			currentYear += 1
			currentMonth = 1
		} else {
			currentMonth += 1
		}
		tomatoCalendar.changeDaysOfMonth(myYear: currentYear, myMonth: currentMonth)
		print("Year: \(currentYear) Month: \(currentMonth)")
	}
	
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let deviceSize = UIScreen.main.bounds.size
		let cellSize: Int = 40
		let calSize = CGSize(width: cellSize * 7, height: cellSize * 7 + 40)		
		tomatoCalendar.position = CGPoint(x: (deviceSize.width - calSize.width) / 2.0, y: (deviceSize.height - calSize.height) / 2.0)
		tomatoCalendar.hasCurrentDate = true
		tomatoCalendar.startYear = 2021
		tomatoCalendar.startMonth = 8
		tomatoCalendar.cellSize = 40
		tomatoCalendar.normalColor = .black
		tomatoCalendar.highlightColor = .lightGray
		tomatoCalendar.buttonCornerRadius = 6.0
		tomatoCalendar.buttonBackColor = .white
		tomatoCalendar.buttonBorderColor = .gray
		tomatoCalendar.buttonBorderWidth = 0.5
		tomatoCalendar.buttonShadowColor = .lightGray
		tomatoCalendar.buttonShadowOpacity = 0.0
		tomatoCalendar.mondayFirst = false
		tomatoCalendar.localDaysText = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
		tomatoCalendar.weekBoxHasBorderColor = true
		tomatoCalendar.weekBoxBackColor = .white
		tomatoCalendar.weekBoxHasBorderColor = true
		tomatoCalendar.weekBoxBorderColor = .black
		tomatoCalendar.weekBoxBorderWidth = 0.5
		tomatoCalendar.weekFont = UIFont.systemFont(ofSize: 15.0)
		tomatoCalendar.hasSunColor = true
		tomatoCalendar.hasMonColor = false
		tomatoCalendar.hasTueColor = false
		tomatoCalendar.hasWedColor = false
		tomatoCalendar.hasThuColor = false
		tomatoCalendar.hasFriColor = false
		tomatoCalendar.hasSatColor = true
		tomatoCalendar.sunColor = .red
		tomatoCalendar.monColor = .brown
		tomatoCalendar.tueColor = .green
		tomatoCalendar.wedColor = .cyan
		tomatoCalendar.thuColor = .purple
		tomatoCalendar.friColor = .orange
		tomatoCalendar.satColor = .blue
		tomatoCalendar.tomatoCalDelegate = self
		
		let exception0 = TomatoCalExceptionModel(year: 2021, month: 12, dayOfMonth: 25)
		let exception1 = TomatoCalExceptionModel(year: 2022, month: 1, dayOfMonth: 1)
		tomatoCalendar.dailyExceptionModels = [exception0, exception1]
		tomatoCalendar.exceptionTextColor = UIColor.white
		tomatoCalendar.weeklyExceptionBackColor = UIColor.red
		tomatoCalendar.dailyExceptionBackColor = UIColor(red: 30/255.0, green: 80/255.0, blue: 206/255.0, alpha: 1)
		tomatoCalendar.weeklyExceptions = [2]
		
		if let calView = tomatoCalendar.makeCalendar() {
			view.addSubview(calView)
		}
	}
	
	
	// MARK: - TomatoCal delegate methods
	func getCalendarNumbers(myYear: Int, myMonth: Int, myDay: Int, myDayOfWeek: Int) {
		print(myYear, myMonth, myDay, myDayOfWeek)
	}
	
	func getStartCalendar(myYear: Int, myMonth: Int) {
		currentYear = myYear
		currentMonth = myMonth
		print("Start year: \(myYear) Start month: \(myMonth)")
	}
}

