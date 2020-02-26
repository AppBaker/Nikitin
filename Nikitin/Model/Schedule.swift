//
//  Schedule.swift
//  Nikitin
//
//  Created by Ivan Nikitin on 26.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import Foundation

struct Schedule : Codable {
    var name : String
    var startTime : String
    var endTime : String
    var teacher : String
    var place : String
    var description : String
    var weekDay : Int
}

enum WeekDay: Int {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

//case monday = "Monday"
//case tuesday = "Tuesday"
//case wednesday = "Wednesday"
//case thursday = "Thursday"
//case friday = "Friday"
//case saturday = "Saturday"
//case sunday = "Sunday"
