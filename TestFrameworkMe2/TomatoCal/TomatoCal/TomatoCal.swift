//
//  Calendar.swift
//  CalendarMania2
//
//  Created by Tomato on 2021/10/15.
//

import UIKit

public protocol TomatoCalDelegate {
	func getCalendarNumbers(myYear: Int, myMonth: Int, myDay: Int, myDayOfWeek: Int)
	func getStartCalendar(myYear: Int, myMonth: Int)
}

public class TomatoCal: NSObject {
	public var position = CGPoint.zero
	public var hasCurrentDate = false
	public var startYear: Int = 2021
	public var startMonth: Int = 10
	public var cellSize: Int = 40
	public var normalColor = UIColor.black
	public var highlightColor = UIColor.lightGray
	
	public var buttonCornerRadius: CGFloat = 4.0
	public var buttonBackColor = UIColor.white
	public var buttonShadowColor = UIColor.black
	public var buttonShadowOpacity: Float = 0.1
	
	public var mondayFirst = false
	public var localDaysText: [String]? = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
	public var hasWeekBackColor = false
	public var weekBackColor = UIColor.white
	public var weekFont = UIFont.systemFont(ofSize: 15.0)
	public var hasSunColor = true
	public var hasMonColor = false
	public var hasTueColor = false
	public var hasWedColor = false
	public var hasThuColor = false
	public var hasFriColor = false
	public var hasSatColor = true
	public var sunColor: UIColor? = UIColor.red
	public var monColor: UIColor?
	public var tueColor: UIColor?
	public var wedColor: UIColor?
	public var thuColor: UIColor?
	public var friColor: UIColor?
	public var satColor: UIColor? = UIColor.blue
		
	func canMakeCalendar() -> Bool {
		if cellSize >= 24 && cellSize <= 60 {
			return true
		} else {
			return false
		}
	}
	
	var allView = UIView()
	public var tomatoCalDelegate: TomatoCalDelegate?
	public func makeCalendar() -> UIView? {
		if canMakeCalendar() {
			allView = UIView(frame: CGRect(origin: position, size: CGSize(width: CGFloat(cellSize * 7), height: CGFloat(cellSize * 7) + 40.0)))
			let weekView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: CGFloat(cellSize * 7), height: 20.0)))
			weekView.backgroundColor = .yellow
			let daysView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 40), size: CGSize(width: CGFloat(cellSize * 7), height: CGFloat(cellSize * 7))))
			if hasWeekBackColor {
				weekView.backgroundColor = weekBackColor
			} else {
				weekView.backgroundColor = .clear
			}
			
			/* accessibilityIdentifier */
			allView.accessibilityIdentifier = "allView"
			weekView.accessibilityIdentifier = "weekView"
			daysView.accessibilityIdentifier = "daysView"
			
			/* making buttons */
			for i in 0..<7 {
				let button = UIButton(frame: CGRect(origin: CGPoint(x: CGFloat(i * cellSize), y: 0.0), size: CGSize(width: cellSize, height: cellSize)))
				button.tag = i
				button.setTitle(String(i), for: .normal)
				button.setTitleColor(normalColor, for: .normal)
				button.setTitleColor(highlightColor, for: .highlighted)
				
				button.layer.cornerRadius = buttonCornerRadius
				button.layer.backgroundColor = buttonBackColor.cgColor
				//button.layer.borderColor = UIColor.clear.cgColor
				button.layer.shadowColor = buttonShadowColor.cgColor
				button.layer.shadowOffset = CGSize.zero
				button.layer.shadowOpacity = buttonShadowOpacity
				
				daysView.addSubview(button)
			}
			
			for i in 7..<14 {
				let button = UIButton(frame: CGRect(origin: CGPoint(x: CGFloat((i - 7) * cellSize), y: CGFloat(cellSize * 1)), size: CGSize(width: cellSize, height: cellSize)))
				button.tag = i
				button.setTitle(String(i), for: .normal)
				button.setTitleColor(normalColor, for: .normal)
				button.setTitleColor(highlightColor, for: .highlighted)
				
				button.layer.cornerRadius = buttonCornerRadius
				button.layer.backgroundColor = buttonBackColor.cgColor
				//button.layer.borderColor = UIColor.clear.cgColor
				button.layer.shadowColor = buttonShadowColor.cgColor
				button.layer.shadowOffset = CGSize.zero
				button.layer.shadowOpacity = buttonShadowOpacity
				
				daysView.addSubview(button)
			}
			
			for i in 14..<21 {
				let button = UIButton(frame: CGRect(origin: CGPoint(x: CGFloat((i - 14) * cellSize), y: CGFloat(cellSize * 2)), size: CGSize(width: cellSize, height: cellSize)))
				button.tag = i
				button.setTitle(String(i), for: .normal)
				button.setTitleColor(normalColor, for: .normal)
				button.setTitleColor(highlightColor, for: .highlighted)
				
				button.layer.cornerRadius = buttonCornerRadius
				button.layer.backgroundColor = buttonBackColor.cgColor
				//button.layer.borderColor = UIColor.clear.cgColor
				button.layer.shadowColor = buttonShadowColor.cgColor
				button.layer.shadowOffset = CGSize.zero
				button.layer.shadowOpacity = buttonShadowOpacity
				
				daysView.addSubview(button)
			}
			
			for i in 21..<28 {
				let button = UIButton(frame: CGRect(origin: CGPoint(x: CGFloat((i - 21) * cellSize), y: CGFloat(cellSize * 3)), size: CGSize(width: cellSize, height: cellSize)))
				button.tag = i
				button.setTitle(String(i), for: .normal)
				button.setTitleColor(normalColor, for: .normal)
				button.setTitleColor(highlightColor, for: .highlighted)
				
				button.layer.cornerRadius = buttonCornerRadius
				button.layer.backgroundColor = buttonBackColor.cgColor
				//button.layer.borderColor = UIColor.clear.cgColor
				button.layer.shadowColor = buttonShadowColor.cgColor
				button.layer.shadowOffset = CGSize.zero
				button.layer.shadowOpacity = buttonShadowOpacity
				
				daysView.addSubview(button)
			}
			
			for i in 28..<35 {
				let button = UIButton(frame: CGRect(origin: CGPoint(x: CGFloat((i - 28) * cellSize), y: CGFloat(cellSize * 4)), size: CGSize(width: cellSize, height: cellSize)))
				button.tag = i
				button.setTitle(String(i), for: .normal)
				button.setTitleColor(normalColor, for: .normal)
				button.setTitleColor(highlightColor, for: .highlighted)
				
				button.layer.cornerRadius = buttonCornerRadius
				button.layer.backgroundColor = buttonBackColor.cgColor
				//button.layer.borderColor = UIColor.clear.cgColor
				button.layer.shadowColor = buttonShadowColor.cgColor
				button.layer.shadowOffset = CGSize.zero
				button.layer.shadowOpacity = buttonShadowOpacity
				
				daysView.addSubview(button)
			}
			
			for i in 35..<42 {
				let button = UIButton(frame: CGRect(origin: CGPoint(x: CGFloat((i - 35) * cellSize), y: CGFloat(cellSize * 5)), size: CGSize(width: cellSize, height: cellSize)))
				button.tag = i
				button.setTitle(String(i), for: .normal)
				button.setTitleColor(normalColor, for: .normal)
				button.setTitleColor(highlightColor, for: .highlighted)
				
				button.layer.cornerRadius = buttonCornerRadius
				button.layer.backgroundColor = buttonBackColor.cgColor
				//button.layer.borderColor = UIColor.clear.cgColor
				button.layer.shadowColor = buttonShadowColor.cgColor
				button.layer.shadowOffset = CGSize.zero
				button.layer.shadowOpacity = buttonShadowOpacity
				
				daysView.addSubview(button)
			}
			
			for i in 42..<44 {
				let button = UIButton(frame: CGRect(origin: CGPoint(x: CGFloat((i - 42) * cellSize), y: CGFloat(cellSize * 6)), size: CGSize(width: cellSize, height: cellSize)))
				button.tag = i
				button.setTitle(String(i), for: .normal)
				button.setTitleColor(normalColor, for: .normal)
				button.setTitleColor(highlightColor, for: .highlighted)
				
				button.layer.cornerRadius = buttonCornerRadius
				button.layer.backgroundColor = buttonBackColor.cgColor
				//button.layer.borderColor = UIColor.clear.cgColor
				button.layer.shadowColor = buttonShadowColor.cgColor
				button.layer.shadowOffset = CGSize.zero
				button.layer.shadowOpacity = buttonShadowOpacity
				
				daysView.addSubview(button)
			}
			
			/* week labels */
			var textGood = false
			if let localDaysStrings = localDaysText {
				if localDaysStrings.count == 7 {
					textGood = true
					if !mondayFirst {
						for i in 0..<7 {
							let label = UILabel(frame: CGRect(origin: CGPoint(x: CGFloat(i * cellSize), y: 0), size: CGSize(width: cellSize, height: 20)))
							label.textAlignment = .center
							label.font = weekFont
							if i == 0 {
								label.text = localDaysStrings[0]
								if hasSunColor {
									if let color = sunColor {
										label.textColor = color
									}
								}
							}
							else if i == 1 {
								label.text = localDaysStrings[1]
								if hasMonColor {
									if let color = monColor {
										label.textColor = color
									}
								}
							}
							else if i == 2 {
								label.text = localDaysStrings[2]
								if hasTueColor {
									if let color = tueColor {
										label.textColor = color
									}
								}
							}
							else if i == 3 {
								label.text = localDaysStrings[3]
								if hasWedColor {
									if let color = wedColor {
										label.textColor = color
									}
								}
							}
							else if i == 4 {
								label.text = localDaysStrings[4]
								if hasThuColor {
									if let color = thuColor {
										label.textColor = color
									}
								}
							}
							else if i == 5 {
								label.text = localDaysStrings[5]
								if hasFriColor {
									if let color = friColor {
										label.textColor = color
									}
								}
							}
							else if i == 6 {
								label.text = localDaysStrings[6]
								if hasSatColor {
									if let color = satColor {
										label.textColor = color
									}
								}
							}
							weekView.addSubview(label)
						}
					} else {
						for i in 0..<7 {
							let label = UILabel(frame: CGRect(origin: CGPoint(x: CGFloat(i * cellSize), y: 0), size: CGSize(width: cellSize, height: 20)))
							label.textAlignment = .center
							label.font = weekFont
							if i == 0 {
								label.text = localDaysStrings[1]
								if hasMonColor {
									if let color = monColor {
										label.textColor = color
									}
								}
							}
							else if i == 1 {
								label.text = localDaysStrings[2]
								if hasTueColor {
									if let color = tueColor {
										label.textColor = color
									}
								}
							}
							else if i == 2 {
								label.text = localDaysStrings[3]
								if hasWedColor {
									if let color = wedColor {
										label.textColor = color
									}
								}
							}
							else if i == 3 {
								label.text = localDaysStrings[4]
								if hasThuColor {
									if let color = thuColor {
										label.textColor = color
									}
								}
							}
							else if i == 4 {
								label.text = localDaysStrings[5]
								if hasFriColor {
									if let color = friColor {
										label.textColor = color
									}
								}
							}
							else if i == 5 {
								label.text = localDaysStrings[6]
								if hasSatColor {
									if let color = satColor {
										label.textColor = color
									}
								}
							}
							else if i == 6 {
								label.text = localDaysStrings[0]
								if hasSunColor {
									if let color = sunColor {
										label.textColor = color
									}
								}
							}
							weekView.addSubview(label)
						}
					}
				}
			}
			if !textGood {
				if !mondayFirst {
					for i in 0..<7 {
						let label = UILabel(frame: CGRect(origin: CGPoint(x: CGFloat(i * cellSize), y: 0), size: CGSize(width: cellSize, height: 20)))
						label.textAlignment = .center
						label.font = weekFont
						if i == 0 {
							label.text = "Sunday"
							if hasSunColor {
								if let color = sunColor {
									label.textColor = color
								}
							}
						}
						else if i == 1 {
							label.text = "Monday"
							if hasMonColor {
								if let color = monColor {
									label.textColor = color
								}
							}
						}
						else if i == 2 {
							label.text = "Tuesday"
							if hasTueColor {
								if let color = tueColor {
									label.textColor = color
								}
							}
						}
						else if i == 3 {
							label.text = "Wednesday"
							if hasWedColor {
								if let color = wedColor {
									label.textColor = color
								}
							}
						}
						else if i == 4 {
							label.text = "Thursday"
							if hasThuColor {
								if let color = thuColor {
									label.textColor = color
								}
							}
						}
						else if i == 5 {
							label.text = "Friday"
							if hasFriColor {
								if let color = friColor {
									label.textColor = color
								}
							}
						}
						else if i == 6 {
							label.text = "Saturday"
							if hasSatColor {
								if let color = satColor {
									label.textColor = color
								}
							}
						}
						weekView.addSubview(label)
					}
				} else {
					for i in 0..<7 {
						let label = UILabel(frame: CGRect(origin: CGPoint(x: CGFloat(i * cellSize), y: 0), size: CGSize(width: cellSize, height: 20)))
						label.textAlignment = .center
						label.font = weekFont
						if i == 0 {
							label.text = "Monday"
							if hasMonColor {
								if let color = monColor {
									label.textColor = color
								}
							}
						}
						else if i == 1 {
							label.text = "Tuesday"
							if hasTueColor {
								if let color = tueColor {
									label.textColor = color
								}
							}
						}
						else if i == 2 {
							label.text = "Wednesday"
							if hasWedColor {
								if let color = wedColor {
									label.textColor = color
								}
							}
						}
						else if i == 3 {
							label.text = "Thursday"
							if hasThuColor {
								if let color = thuColor {
									label.textColor = color
								}
							}
						}
						else if i == 4 {
							label.text = "Friday"
							if hasFriColor {
								if let color = friColor {
									label.textColor = color
								}
							}
						}
						else if i == 5 {
							label.text = "Saturday"
							if hasSatColor {
								if let color = satColor {
									label.textColor = color
								}
							}
						}
						else if i == 6 {
							label.text = "Sunday"
							if hasSunColor {
								if let color = sunColor {
									label.textColor = color
								}
							}
						}
						weekView.addSubview(label)
					}
				}
			}
			
			/* adding them to allView */
			allView.addSubview(weekView)
			allView.addSubview(daysView)
			
			/* changing days of month */
			if !hasCurrentDate {
				changeDaysOfMonth(myYear: startYear, myMonth: startMonth)
				tomatoCalDelegate?.getStartCalendar(myYear: startYear, myMonth: startMonth)
			} else {
				let now = Date()
				let localYear = getLocalYearNow(date: now)
				let localMonth = getLocalMonthNow(date: now)
				changeDaysOfMonth(myYear: localYear, myMonth: localMonth)
				tomatoCalDelegate?.getStartCalendar(myYear: localYear, myMonth: localMonth)
			}
			
			/* returning allView */
			return allView
		}
		
		return nil
	}
	
	public func changeDaysOfMonth(myYear: Int, myMonth: Int) {
		for nextSub in allView.subviews {
			if nextSub.accessibilityIdentifier == "daysView" {
				for button in nextSub.subviews {
					button.isHidden = true
				}
				break
			}
		}
		
		let firstDay = makeDate(year: myYear, month: myMonth, day: 1, hr: 0, min: 0, sec: 0)
		
		if let firstDayOfWeek = getLocalDayofWeek(date: firstDay), let numberOfDays = getNumberOfDays(year: myYear, month: myMonth) {
			if !mondayFirst {
				if firstDayOfWeek == 1 {
					//print("Sunday")
					for nextSub in allView.subviews {
						if nextSub.accessibilityIdentifier == "daysView" {
							for i in 0..<numberOfDays {
								let item = nextSub.subviews[i]
								if let button = item as? UIButton {
									button.isHidden = false
									button.setTitle(String(i + 1), for: .normal)
									button.accessibilityIdentifier = String(myYear) + "," + String(myMonth) + "," + String(i + 1)
									button.addTarget(self, action: #selector(printDate(_:)), for: .touchUpInside)
								}
							}
							break
						}
					}
				}
				else if firstDayOfWeek == 2 {
					//print("Monday")
					for nextSub in allView.subviews {
						if nextSub.accessibilityIdentifier == "daysView" {
							for i in 1..<numberOfDays + 1 {
								let item = nextSub.subviews[i]
								if let button = item as? UIButton {
									button.isHidden = false
									button.setTitle(String(i), for: .normal)
									button.accessibilityIdentifier = String(myYear) + "," + String(myMonth) + "," + String(i)
									button.addTarget(self, action: #selector(printDate(_:)), for: .touchUpInside)
								}
							}
							break
						}
					}
				}
				else if firstDayOfWeek == 3 {
					//print("Tuesday")
					for nextSub in allView.subviews {
						if nextSub.accessibilityIdentifier == "daysView" {
							for i in 2..<numberOfDays + 2 {
								let item = nextSub.subviews[i]
								if let button = item as? UIButton {
									button.isHidden = false
									button.setTitle(String(i - 1), for: .normal)
									button.accessibilityIdentifier = String(myYear) + "," + String(myMonth) + "," + String(i - 1)
									button.addTarget(self, action: #selector(printDate(_:)), for: .touchUpInside)
								}
							}
							break
						}
					}
				}
				else if firstDayOfWeek == 4 {
					//print("Wednesday")
					for nextSub in allView.subviews {
						if nextSub.accessibilityIdentifier == "daysView" {
							for i in 3..<numberOfDays + 3 {
								let item = nextSub.subviews[i]
								if let button = item as? UIButton {
									button.isHidden = false
									button.setTitle(String(i - 2), for: .normal)
									button.accessibilityIdentifier = String(myYear) + "," + String(myMonth) + "," + String(i - 2)
									button.addTarget(self, action: #selector(printDate(_:)), for: .touchUpInside)
								}
							}
							break
						}
					}
				}
				else if firstDayOfWeek == 5 {
					//print("Thursday")
					for nextSub in allView.subviews {
						if nextSub.accessibilityIdentifier == "daysView" {
							for i in 4..<numberOfDays + 4 {
								let item = nextSub.subviews[i]
								if let button = item as? UIButton {
									button.isHidden = false
									button.setTitle(String(i - 3), for: .normal)
									button.accessibilityIdentifier = String(myYear) + "," + String(myMonth) + "," + String(i - 3)
									button.addTarget(self, action: #selector(printDate(_:)), for: .touchUpInside)
								}
							}
							break
						}
					}
				}
				else if firstDayOfWeek == 6 {
					//print("Friday")
					for nextSub in allView.subviews {
						if nextSub.accessibilityIdentifier == "daysView" {
							for i in 5..<numberOfDays + 5 {
								let item = nextSub.subviews[i]
								if let button = item as? UIButton {
									button.isHidden = false
									button.setTitle(String(i - 4), for: .normal)
									button.accessibilityIdentifier = String(myYear) + "," + String(myMonth) + "," + String(i - 4)
									button.addTarget(self, action: #selector(printDate(_:)), for: .touchUpInside)
								}
							}
							break
						}
					}
				}
				else {
					//print("Saturday")
					for nextSub in allView.subviews {
						if nextSub.accessibilityIdentifier == "daysView" {
							for i in 6..<numberOfDays + 6 {
								let item = nextSub.subviews[i]
								if let button = item as? UIButton {
									button.isHidden = false
									button.setTitle(String(i - 5), for: .normal)
									button.accessibilityIdentifier = String(myYear) + "," + String(myMonth) + "," + String(i - 5)
									button.addTarget(self, action: #selector(printDate(_:)), for: .touchUpInside)
								}
							}
							break
						}
					}
				}
			}
			else {
				if firstDayOfWeek == 1 {
					//print("Sunday")
					for nextSub in allView.subviews {
						if nextSub.accessibilityIdentifier == "daysView" {
							for i in 6..<numberOfDays + 6 {
								let item = nextSub.subviews[i]
								if let button = item as? UIButton {
									button.isHidden = false
									button.setTitle(String(i - 5), for: .normal)
									button.accessibilityIdentifier = String(myYear) + "," + String(myMonth) + "," + String(i - 5)
									button.addTarget(self, action: #selector(printDate(_:)), for: .touchUpInside)
								}
							}
							break
						}
					}
				}
				else if firstDayOfWeek == 2 {
					//print("Monday")
					for nextSub in allView.subviews {
						if nextSub.accessibilityIdentifier == "daysView" {
							for i in 0..<numberOfDays {
								let item = nextSub.subviews[i]
								if let button = item as? UIButton {
									button.isHidden = false
									button.setTitle(String(i + 1), for: .normal)
									button.accessibilityIdentifier = String(myYear) + "," + String(myMonth) + "," + String(i + 1)
									button.addTarget(self, action: #selector(printDate(_:)), for: .touchUpInside)
								}
							}
							break
						}
					}
				}
				else if firstDayOfWeek == 3 {
					//print("Tuesday")
					for nextSub in allView.subviews {
						if nextSub.accessibilityIdentifier == "daysView" {
							for i in 1..<numberOfDays + 1 {
								let item = nextSub.subviews[i]
								if let button = item as? UIButton {
									button.isHidden = false
									button.setTitle(String(i), for: .normal)
									button.accessibilityIdentifier = String(myYear) + "," + String(myMonth) + "," + String(i)
									button.addTarget(self, action: #selector(printDate(_:)), for: .touchUpInside)
								}
							}
							break
						}
					}
				}
				else if firstDayOfWeek == 4 {
					//print("Wednesday")
					for nextSub in allView.subviews {
						if nextSub.accessibilityIdentifier == "daysView" {
							for i in 2..<numberOfDays + 2 {
								let item = nextSub.subviews[i]
								if let button = item as? UIButton {
									button.isHidden = false
									button.setTitle(String(i - 1), for: .normal)
									button.accessibilityIdentifier = String(myYear) + "," + String(myMonth) + "," + String(i - 1)
									button.addTarget(self, action: #selector(printDate(_:)), for: .touchUpInside)
								}
							}
							break
						}
					}
				}
				else if firstDayOfWeek == 5 {
					//print("Thursday")
					for nextSub in allView.subviews {
						if nextSub.accessibilityIdentifier == "daysView" {
							for i in 3..<numberOfDays + 3 {
								let item = nextSub.subviews[i]
								if let button = item as? UIButton {
									button.isHidden = false
									button.setTitle(String(i - 2), for: .normal)
									button.accessibilityIdentifier = String(myYear) + "," + String(myMonth) + "," + String(i - 2)
									button.addTarget(self, action: #selector(printDate(_:)), for: .touchUpInside)
								}
							}
							break
						}
					}
				}
				else if firstDayOfWeek == 6 {
					//print("Friday")
					for nextSub in allView.subviews {
						if nextSub.accessibilityIdentifier == "daysView" {
							for i in 4..<numberOfDays + 4 {
								let item = nextSub.subviews[i]
								if let button = item as? UIButton {
									button.isHidden = false
									button.setTitle(String(i - 3), for: .normal)
									button.accessibilityIdentifier = String(myYear) + "," + String(myMonth) + "," + String(i - 3)
									button.addTarget(self, action: #selector(printDate(_:)), for: .touchUpInside)
								}
							}
							break
						}
					}
				}
				else {
					//print("Saturday")
					for nextSub in allView.subviews {
						if nextSub.accessibilityIdentifier == "daysView" {
							for i in 5..<numberOfDays + 5 {
								let item = nextSub.subviews[i]
								if let button = item as? UIButton {
									button.isHidden = false
									button.setTitle(String(i - 4), for: .normal)
									button.accessibilityIdentifier = String(myYear) + "," + String(myMonth) + "," + String(i - 4)
									button.addTarget(self, action: #selector(printDate(_:)), for: .touchUpInside)
								}
							}
							break
						}
					}
				}
			}
		}
	}
	
	@objc func printDate(_ sender: UIButton) {
		if let text = sender.accessibilityIdentifier {
			let components = text.components(separatedBy: ",")
			let myYear = Int(components[0])!
			let myMonth = Int(components[1])!
			let myDay = Int(components[2])!
			//print(myYear, myMonth, myDay)
			let myDate = makeDate(year: myYear, month: myMonth, day: myDay, hr: 0, min: 0, sec: 0)
			if let myDayOfWeek = getLocalDayofWeek(date: myDate) {
				//print("day of week: \(myDayOfWeek)")
				tomatoCalDelegate?.getCalendarNumbers(myYear: myYear, myMonth: myMonth, myDay: myDay, myDayOfWeek: myDayOfWeek)
			}
		}
	}
	
	
	// MARK: - Functions
	func getNumberOfDays(year: Int, month: Int) -> Int? {
		let dateComponents = DateComponents(year: year, month: month)
		let calendar = Calendar.current
		if let date = calendar.date(from: dateComponents) {
			if let range = calendar.range(of: .day, in: .month, for: date) {
				return range.count
			}
			return nil
		}
		return nil
	}
	
	func makeDate(year: Int, month: Int, day: Int, hr: Int, min: Int, sec: Int) -> Date {
		/* according to GMT */
		var calendar = Calendar(identifier: .gregorian)
		calendar.timeZone = TimeZone(secondsFromGMT: 0)! // <<<<<<<<<<<<<<<<<<<
		let components = DateComponents(year: year, month: month, day: day, hour: hr, minute: min, second: sec)
		return calendar.date(from: components)!
	}
	
	func getLocalYearNow(date: Date) -> Int {
		var cal = Calendar(identifier: .gregorian)
		cal.timeZone = TimeZone.ReferenceType.local
		return cal.component(.year, from: date)
	}
	
	func getLocalMonthNow(date: Date) -> Int {
		var cal = Calendar(identifier: .gregorian)
		cal.timeZone = TimeZone.ReferenceType.local
		return cal.component(.month, from: date)
	}
	
	func getLocalDayofWeek(date: Date) -> Int? {
		let cal = Calendar.current
				let components = cal.dateComponents(in: NSTimeZone.local, from: date)
				if let weekday = components.weekday {
					// https://developer.apple.com/documentation/foundation/nsdatecomponents/1410442-weekday
					// Sunday: 1, Monday: 2, Tuesday: 3, Wednesday: 4, Thursday: 5, Friday: 6, Saturday: 7 //
					return weekday
				}
				return nil
	}
}

