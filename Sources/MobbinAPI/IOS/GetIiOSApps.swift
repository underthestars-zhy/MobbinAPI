//
//  GetApps.swift
//  
//
//  Created by 朱浩宇 on 2023/4/27.
//

import Foundation
import SwiftyJSON

extension MobbinAPI {
    func getAlliOSApps() async throws -> [iOSApp] {
        guard let token else { throw MobbinError.cannotFindToken }

        var currentCount = 0
        var lastAppPublishedDate: Date? = nil
        let totalCount = try await self.iOSAppsCount

        var res = [iOSApp]()

        func recursion() async throws -> [iOSApp] {
            guard var URL = URL(string: "https://ujasntkfphywizsdaapi.supabase.co/rest/v1/rpc/get_apps_with_preview_screens_filter") else { throw HTTPError.wrongUrlFormat }
            let URLParams = [
                "select": "*",
            ]
            URL = URL.appendingQueryParameters(URLParams)
            var request = URLRequest(url: URL)
            request.httpMethod = "POST"

            // Headers

            request.addValue("supabase-js/1.35.7", forHTTPHeaderField: "X-Client-Info")
            request.addValue("\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"", forHTTPHeaderField: "sec-ch-ua")
            request.addValue("Bearer \(token.accessToken)", forHTTPHeaderField: "Authorization")
            request.addValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.0.0", forHTTPHeaderField: "User-Agent")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("public", forHTTPHeaderField: "Content-Profile")
            request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYyNTQ2MDM3NSwiZXhwIjoxOTQxMDM2Mzc1fQ.IgHG-M4znmVhQEa6uWWb3gz-_XXjsSvPPF8NBad8gvk", forHTTPHeaderField: "apikey")
            request.addValue("\"macOS\"", forHTTPHeaderField: "sec-ch-ua-platform")
            request.addValue("*/*", forHTTPHeaderField: "Accept")
            request.addValue("https://mobbin.com", forHTTPHeaderField: "Origin")
            request.addValue("cross-site", forHTTPHeaderField: "Sec-Fetch-Site")
            request.addValue("cors", forHTTPHeaderField: "Sec-Fetch-Mode")
            request.addValue("empty", forHTTPHeaderField: "Sec-Fetch-Dest")
            request.addValue("https://mobbin.com/", forHTTPHeaderField: "Referer")
            request.addValue("gzip, deflate, br", forHTTPHeaderField: "Accept-Encoding")
            request.addValue("en-US,en;q=0.9", forHTTPHeaderField: "Accept-Language")

            // JSON Body

            let bodyObject: [String : Any] = [
                "filterAppCategories": NSNull(),
                "filterAppCompanyStages": NSNull(),
                "filterAppPlatform": "ios",
                "filterOperator": "and",
                "lastAppVersionUpdatedAt": NSNull(),
                "filterAppStyles": NSNull(),
                "filterAppRegions": NSNull(),
                "pageSize": 24,
                "lastAppId": NSNull(),
                "lastAppVersionPublishedAt": lastAppPublishedDate?.mobbin ?? NSNull()
            ]
            request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])

            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw HTTPError.badResponse
            }

            let json = try JSON(data: data)

            print(json.array?.count)

            return try json.array?.map { json throws -> iOSApp in
                let id = json["id"].stringValue
                let appName = json["appName"].stringValue
                let appCategory = json["appCategory"].stringValue
                let appStyle = json["appStyle"].string
                guard let appLogoUrl = Foundation.URL(string: json["appLogoUrl"].stringValue) else {
                    throw MobbinError.wrongURL(json["appLogoUrl"].stringValue)
                }
                let appTagline = json["appTagline"].stringValue
                let companyHqRegion = json["companyHqRegion"].stringValue
                let companyStage = json["companyStage"].stringValue
                let platform = json["platform"].stringValue
                guard let createdAt = Date.create(mobbin: json["createdAt"].stringValue) else {
                    throw MobbinError.wrongDate(json["createdAt"].stringValue)
                }
                let appVersionId = json["appVersionId"].stringValue
                guard let appVersionCreatedAt = Date.create(mobbin: json["appVersionCreatedAt"].stringValue) else {
                    throw MobbinError.wrongDate(json["appVersionCreatedAt"].stringValue)
                }
                guard let appVersionUpdatedAt = Date.create(mobbin: json["appVersionUpdatedAt"].stringValue) else {
                    throw MobbinError.wrongDate(json["appVersionUpdatedAt"].stringValue)
                }
                guard let appVersionPublishedAt = Date.create(mobbin: json["appVersionPublishedAt"].stringValue) else {
                    throw MobbinError.wrongDate(json["appVersionPublishedAt"].stringValue)
                }
                let previewScreenUrls = json["previewScreenUrls"].array?.compactMap({ url in
                    Foundation.URL(string: url.stringValue)
                }) ?? []

                return iOSApp(id: id, appName: appName, appCategory: appCategory, appStyle: appStyle, appLogoUrl: appLogoUrl, appTagline: appTagline, companyHqRegion: companyHqRegion, companyStage: companyStage, platform: platform, createdAt: createdAt, appVersionId: appVersionId, appVersionCreatedAt: appVersionCreatedAt, appVersionUpdatedAt: appVersionUpdatedAt, appVersionPublishedAt: appVersionPublishedAt, previewScreenUrls: previewScreenUrls)
            } ?? []
        }

        while currentCount < (totalCount - 1) {
            let apps = try await recursion()
            res += apps
            currentCount = res.count
            if let date = apps.last?.appVersionPublishedAt {
                lastAppPublishedDate = date
            }

            print(lastAppPublishedDate?.mobbin, apps.last?.appName, apps.count, currentCount)
        }

        return res
    }
}
