//
//  DateExtension.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

extension Date {
    init(day: Int, month: Int, year: Int, hour: Int = 0, minute: Int = 0, second : Int = 0) {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var components = DateComponents()
        components.day = day
        components.month = month
        components.year = year
        components.hour = hour
        components.minute = minute
        components.second = second
        self = calendar.date(from: components)!
    }
}
