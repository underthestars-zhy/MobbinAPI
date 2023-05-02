//
//  Token.swift
//  
//
//  Created by 朱浩宇 on 2023/4/26.
//

import Foundation
import SwiftyJSON

public struct Token: Codable {
    public var accessToken: String
    public var refreshToken: String
    public var generatedTime: Date

    public init(accessToken: String, refreshToken: String) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.generatedTime = Date()
    }

    mutating func refresh() async throws {
        guard var URL = URL(string: "https://ujasntkfphywizsdaapi.supabase.co/auth/v1/token") else { throw HTTPError.wrongUrlFormat }
        let URLParams = [
            "grant_type": "refresh_token",
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
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYyNTQ2MDM3NSwiZXhwIjoxOTQxMDM2Mzc1fQ.IgHG-M4znmVhQEa6uWWb3gz-_XXjsSvPPF8NBad8gvk", forHTTPHeaderField: "Authorization")
        request.addValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1820.0", forHTTPHeaderField: "User-Agent")
        request.addValue("text/plain;charset=UTF-8", forHTTPHeaderField: "Content-Type")
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

        // Body

        let bodyString = "{\"refresh_token\":\"\(refreshToken)\"}"
        request.httpBody = bodyString.data(using: .utf8, allowLossyConversion: true)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw HTTPError.badResponse
        }

        let json = try JSON(data: data)

        self.accessToken = json["access_token"].stringValue
        self.refreshToken = json["refresh_token"].stringValue
        self.generatedTime = Date()
    }
}

extension MobbinAPI {
    public func refreshToken() async throws {
        try await self.token?.refresh()
    }
}
