//
//  UserInfo.swift
//  
//
//  Created by 朱浩宇 on 2023/4/26.
//

import Foundation

public struct UserInfo: Codable {
    let id: String
    let aud: String
    let role: String
    let email: String
    let emailConfirmedAt: Date
    let recoverySentAt: Date
    let lastSignInAt: Date
    let avatarUrl: URL
    let fullName: String

    public init(id: String, aud: String, role: String, email: String, emailConfirmedAt: Date, recoverySentAt: Date, lastSignInAt: Date, avatarUrl: URL, fullName: String) {
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

    public init?(id: String, aud: String, role: String, email: String, emailConfirmedAt: String, recoverySentAt: String, lastSignInAt: String, avatarUrl: String, fullName: String) {
        guard let emailConfirmedAt = Date.create(login: emailConfirmedAt) else { return nil }
        guard let recoverySentAt =  Date.create(login: recoverySentAt) else { return nil }
        guard let lastSignInAt =  Date.create(login: lastSignInAt) else { return nil }
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
