//
//  File.swift
//  
//
//  Created by 朱浩宇 on 2023/4/27.
//

import Foundation

extension Date {
    static func create(login dateString: String) -> Date? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter.date(from: dateString)
    }

    static func create(mobbin dateString: String) -> Date? {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter1.timeZone = TimeZone(abbreviation: "UTC")

        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter2.timeZone = TimeZone(abbreviation: "UTC")

        let dateFormatter3 = ISO8601DateFormatter()
        dateFormatter3.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        dateFormatter3.timeZone = TimeZone(abbreviation: "UTC")

        return dateFormatter1.date(from: dateString) ?? dateFormatter2.date(from: dateString) ?? dateFormatter3.date(from: dateString)
    }

    var mobbin: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormatter.string(from: self)
    }
}
