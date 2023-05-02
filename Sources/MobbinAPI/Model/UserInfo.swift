//
//  UserInfo.swift
//  
//
//  Created by 朱浩宇 on 2023/4/26.
//

import Foundation

public struct UserInfo: Codable {
    public let id: String
    public let aud: String
    public let role: String
    public let email: String
    public let emailConfirmedAt: Date
    public let recoverySentAt: Date
    public let lastSignInAt: Date
    public let avatarUrl: URL
    public let fullName: String

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
