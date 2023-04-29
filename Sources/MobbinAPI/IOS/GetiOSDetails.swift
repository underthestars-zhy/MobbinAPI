//
//  GetiOSDetails.swift
//  
//
//  Created by 朱浩宇 on 2023/4/27.
//

import Foundation
import SwiftyJSON

extension MobbinAPI {
    public func getiOSScreens(of app: App) async throws -> [Screen] {
        guard let token else { throw MobbinError.cannotFindToken }

        guard var URL = URL(string: "https://ujasntkfphywizsdaapi.supabase.co/rest/v1/rpc/get_app_screens_filter") else { throw HTTPError.wrongUrlFormat }
        let URLParams = [
            "select": "screenNumber,screenUrl,appVersionId,id,screenElements,screenPatterns,pagePatterns,pageType,pageUrl,fullpageScreenUrl,updatedAt,createdAt",
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
            "filterAppVersionId": app.appVersionId,
            "filterOperator": "and",
            "filterScreenElements": NSNull(),
            "filterScreenPatterns": NSNull(),
            "filterPagePatterns": NSNull(),
            "filterPageTypes": NSNull(),
            "filterScreenKeywords": NSNull()
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw HTTPError.badResponse
        }

        let json = try JSON(data: data)

        return try json.array?.map { json throws -> Screen in
            let screenNumber = json["screenNumber"].intValue
            guard let screenUrl = Foundation.URL(string: json["screenUrl"].stringValue) else {
                throw MobbinError.wrongURL(json["screenUrl"].stringValue)
            }
            let appVersionId = json["appVersionId"].stringValue
            let id = json["id"].stringValue
            let screenElements = json["screenElements"].array?.map(\.stringValue) ?? []
            let screenPatterns = json["screenPatterns"].array?.map(\.stringValue) ?? []
            guard let updatedAt = Date.create(mobbin: json["updatedAt"].stringValue) else {
                throw MobbinError.wrongDate(json["updatedAt"].stringValue)
            }
            guard let createdAt = Date.create(mobbin: json["createdAt"].stringValue) else {
                throw MobbinError.wrongDate(json["createdAt"].stringValue)
            }

            return Screen(screenNumber: screenNumber, screenUrl: screenUrl, appVersionId: appVersionId, id: id, screenElements: screenElements, screenPatterns: screenPatterns, updatedAt: updatedAt, createdAt: createdAt)
        } ?? []
    }

    public func getiOSFlows(of app: App) async throws -> [Flow] {
        guard let token else { throw MobbinError.cannotFindToken }

        guard var URL = URL(string: "https://ujasntkfphywizsdaapi.supabase.co/rest/v1/rpc/get_app_sections_filter") else { throw HTTPError.wrongUrlFormat }
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
        request.addValue("266", forHTTPHeaderField: "Content-Length")

        // JSON Body

        let bodyObject: [String : Any] = [
            "filterAppVersionId": app.appVersionId,
            "filterOperator": "and",
            "filterFlowTitles": NSNull(),
            "filterScreenPatterns": NSNull(),
            "filterPagePatterns": NSNull(),
            "filterFlowActions": NSNull(),
            "filterPageTypes": NSNull(),
            "filterScreenKeywords": NSNull(),
            "filterScreenElements": NSNull()
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw HTTPError.badResponse
        }

        let json = try JSON(data: data)

        return try json.array?.map { json throws -> Flow in
            let appVersionId = json["appVersionId"].stringValue
            let parentAppSectionId = json["parentAppSectionId"].string
            guard let updatedAt = Date.create(mobbin: json["updatedAt"].stringValue) else {
                throw MobbinError.wrongDate(json["updatedAt"].stringValue)
            }
            let order = json["order"].intValue
            let id = json["id"].stringValue
            let name = json["name"].stringValue
            let actions = json["actions"].array?.map(\.stringValue) ?? []

            let screens = try json["screens"].array?.map({ json throws -> Flow.Screen in
                guard let screenUrl = Foundation.URL(string: json["screenUrl"].stringValue) else {
                    throw MobbinError.wrongURL(json["screenUrl"].stringValue)
                }
                let hotspotHeight = json["hotspotHeight"].double
                let hotspotWidth = json["hotspotWidth"].double
                let hotspotY = json["hotspotY"].double
                let hotspotX = json["hotspotX"].double
                let hotspotType = json["hotspotType"].string
                let appScreenId = json["appScreenId"].stringValue
                let order = json["order"].intValue

                return Flow.Screen(appScreenId: appScreenId, order: order, hotspotWidth: hotspotWidth, hotspotHeight: hotspotHeight, hotspotX: hotspotX, hotspotY: hotspotY, hotspotType: hotspotType, screenUrl: screenUrl)
            }) ?? []

            return Flow(id: id, name: name, actions: actions, parentAppSectionId: parentAppSectionId, order: order, updatedAt: updatedAt, appVersionId: appVersionId, screens: screens)
        } ?? []
    }
}
