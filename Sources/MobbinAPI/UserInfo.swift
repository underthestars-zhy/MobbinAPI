//
//  UserInfo.swift
//  
//
//  Created by 朱浩宇 on 2023/4/26.
//

import Foundation

struct UserInfo {
    let id: String
    let aud: String
    let role: String
    let email: String
    let emailConfirmedAt: Date
    let recoverySentAt: Date
    let lastSignInAt: Date
    let avatarUrl: URL
    let fullName: String

    init(id: String, aud: String, role: String, email: String, emailConfirmedAt: Date, recoverySentAt: Date, lastSignInAt: Date, avatarUrl: URL, fullName: String) {
        self.id = id
        self.aud = aud
        self.role = role
        self.email = email
        self.emailConfirmedAt = emailConfirmedAt
        self.recoverySentAt = recoverySentAt
        self.lastSignInAt = lastSignInAt
        self.avatarUrl = avatarUrl
        self.fullName = fullName
    }

    init?(id: String, aud: String, role: String, email: String, emailConfirmedAt: String, recoverySentAt: String, lastSignInAt: String, avatarUrl: String, fullName: String) {

        func convertToDate(_ dateString: String) -> Date? {
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            return formatter.date(from: dateString)
        }

        guard let emailConfirmedAt = convertToDate(emailConfirmedAt) else { return nil }
        guard let recoverySentAt = convertToDate(recoverySentAt) else { return nil }
        guard let lastSignInAt = convertToDate(lastSignInAt) else { return nil }
        guard let avatarUrl = URL(string: avatarUrl) else { return nil }

        self.id = id
        self.aud = aud
        self.role = role
        self.email = email
        self.emailConfirmedAt = emailConfirmedAt
        self.recoverySentAt = recoverySentAt
        self.lastSignInAt = lastSignInAt
        self.avatarUrl = avatarUrl
        self.fullName = fullName
    }
}
