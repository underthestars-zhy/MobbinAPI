//
//  QueryFlowsInCollection.swift
//  
//
//  Created by 朱浩宇 on 2023/4/29.
//

import Foundation
import SwiftyJSON

extension MobbinAPI {
    public func queryFlows(in collection: Collection) async throws -> [Collection.Flow] {
        guard let token else { throw MobbinError.cannotFindToken }

        guard var URL = URL(string: "https://ujasntkfphywizsdaapi.supabase.co/rest/v1/rpc/get_app_sections_with_app_screens_collection_filter") else { throw HTTPError.wrongUrlFormat }
        let URLParams = [
            "select": "*",
        ]
        URL = URL.appendingQueryParameters(URLParams)
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"

        // Headers

        request.addValue("ujasntkfphywizsdaapi.supabase.co", forHTTPHeaderField: "Host")
        request.addValue("keep-alive", forHTTPHeaderField: "Connection")
        request.addValue("supabase-js/1.35.7", forHTTPHeaderField: "X-Client-Info")
        request.addValue("\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"", forHTTPHeaderField: "sec-ch-ua")
        request.addValue("?0", forHTTPHeaderField: "sec-ch-ua-mobile")
        request.addValue("Bearer \(token.accessToken)", forHTTPHeaderField: "Authorization")
        request.addValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1820.0", forHTTPHeaderField: "User-Agent")
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
            "filterFlowActions": NSNull(),
            "filterPlatformType": "mobile",
            "filterAppCategories": NSNull(),
            "filterPagePatterns": NSNull(),
            "filterScreenPatterns": NSNull(),
            "filterAppRegions": NSNull(),
            "filterPageTypes": NSNull(),
            "filterFlowTitles": NSNull(),
            "filterAppPlatforms": NSNull(),
            "filterAppStyles": NSNull(),
            "filterScreenKeywords": NSNull(),
            "filterAppCompanyStages": NSNull(),
            "filterCollectionId": collection.id,
            "filterOperator": "and",
            "filterScreenElements": NSNull()
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw HTTPError.badResponse
        }

        let json = try JSON(data: data)

        return try json.array?.map { json throws -> Collection.Flow in
            let id = json["id"].stringValue
            let name = json["name"].stringValue
            let actions = json["actions"].array?.map(\.stringValue) ?? []
            let order = json["order"].intValue
            let appId = json["appId"].stringValue
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
            let collectionId = json["collectionId"].stringValue
            let collectionAppSectionId = json["collectionAppSectionId"].stringValue
            guard let collectionAppSectionUpdatedAt = Date.create(mobbin: json["collectionAppSectionUpdatedAt"].stringValue) else {
                throw MobbinError.wrongDate(json["collectionAppSectionUpdatedAt"].stringValue)
            }

            let screens = try json["screens"].array?.map { json throws -> Collection.Flow.Screen in
                let id = json["id"].stringValue
                let order = json["order"].intValue
                let hotspotType = json["hotspotType"].string
                let hotspotHeight = json["hotspotHeight"].double
                let hotspotWidth = json["hotspotWidth"].double
                let hotspotY = json["hotspotY"].double
                let hotspotX = json["hotspotX"].double
                let screenId = json["screenId"].stringValue
                let screenElements = json["screenElements"].array?.map(\.stringValue) ?? []
                let screenPatterns = json["screenPatterns"].array?.map(\.stringValue) ?? []
                guard let screenUrl = Foundation.URL(string: json["screenUrl"].stringValue) else {
                    throw MobbinError.wrongURL(json["screenUrl"].stringValue)
                }

                return Collection.Flow.Screen(id: id, order: order, hotspotType: hotspotType, hotspotX: hotspotHeight, hotspotY: hotspotWidth, hotspotWidth: hotspotY, hotspotHeight: hotspotX, screenID: screenId, screenElements: screenElements, screenPatterns: screenPatterns, screenURL: screenUrl)
            } ?? []

            return Collection.Flow(id: id, name: name, actions: actions, order: order, appID: appId, appName: appName, appCategory: appCategory, appStyle: appStyle, appLogoURL: appLogoUrl, appTagline: appTagline, companyHqRegion: companyHqRegion, companyStage: companyStage, platform: platform, appVersionID: appVersionId, appVersionCreatedAt: appVersionCreatedAt, appVersionUpdatedAt: appVersionUpdatedAt, appVersionPublishedAt: appVersionPublishedAt, collectionID: collectionId, collectionAppSectionID: collectionAppSectionId, collectionAppSectionUpdatedAt: collectionAppSectionUpdatedAt, screens: screens)
        } ?? []
    }
}
