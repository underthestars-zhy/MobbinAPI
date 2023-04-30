//
//  AppVersion.swift
//  
//
//  Created by 朱浩宇 on 2023/4/30.
//

import Foundation

extension MobbinAPI {
    func versions(of app: App, mobbinToken: String? = nil) async throws -> [Version] {
        let json = try await mobbinAppInfo(of: app, mobbinToken: mobbinToken)

        return try json["pageProps"]["app"]["appVersions"].array?.map({ json in
            let id = json["id"].stringValue
            guard let createdAt = Date.create(mobbin: json["createdAt"].stringValue) else {
                throw MobbinError.wrongDate(json["createdAt"].stringValue)
            }
            guard let publishedAt = Date.create(mobbin: json["publishedAt"].stringValue) else {
                throw MobbinError.wrongDate(json["publishedAt"].stringValue)
            }

            return Version(id: id, createdAt: createdAt, publishedAt: publishedAt)
        }) ?? []
    }
}
