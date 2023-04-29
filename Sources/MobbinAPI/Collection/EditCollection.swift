//
//  EditCollection.swift
//
//
//  Created by 朱浩宇 on 2023/4/29.
//

import Foundation
import SwiftyJSON

extension MobbinAPI {
    func edit(collection: Collection, name: String?, description: String?) async throws -> Collection {
        guard let token else { throw MobbinError.cannotFindToken }

        guard var URL = URL(string: "https://ujasntkfphywizsdaapi.supabase.co/rest/v1/collections") else { throw HTTPError.wrongUrlFormat }
        let URLParams = [
            "id": "eq.\(collection.id)",
        ]
        URL = URL.appendingQueryParameters(URLParams)
        var request = URLRequest(url: URL)
        request.httpMethod = "PATCH"

        // Headers

        request.addValue("ujasntkfphywizsdaapi.supabase.co", forHTTPHeaderField: "Host")
        request.addValue("keep-alive", forHTTPHeaderField: "Connection")
        request.addValue("supabase-js/1.35.7", forHTTPHeaderField: "X-Client-Info")
        request.addValue("\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"", forHTTPHeaderField: "sec-ch-ua")
        request.addValue("return=representation", forHTTPHeaderField: "Prefer")
        request.addValue("?0", forHTTPHeaderField: "sec-ch-ua-mobile")
        request.addValue("Bearer \(token.accessToken)", forHTTPHeaderField: "Authorization")
        request.addValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1820.0", forHTTPHeaderField: "User-Agent")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/vnd.pgrst.object+json", forHTTPHeaderField: "Accept")
        request.addValue("public", forHTTPHeaderField: "Content-Profile")
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYyNTQ2MDM3NSwiZXhwIjoxOTQxMDM2Mzc1fQ.IgHG-M4znmVhQEa6uWWb3gz-_XXjsSvPPF8NBad8gvk", forHTTPHeaderField: "apikey")
        request.addValue("\"macOS\"", forHTTPHeaderField: "sec-ch-ua-platform")
        request.addValue("https://mobbin.com", forHTTPHeaderField: "Origin")
        request.addValue("cross-site", forHTTPHeaderField: "Sec-Fetch-Site")
        request.addValue("cors", forHTTPHeaderField: "Sec-Fetch-Mode")
        request.addValue("empty", forHTTPHeaderField: "Sec-Fetch-Dest")
        request.addValue("https://mobbin.com/", forHTTPHeaderField: "Referer")
        request.addValue("gzip, deflate, br", forHTTPHeaderField: "Accept-Encoding")
        request.addValue("en-US,en;q=0.9", forHTTPHeaderField: "Accept-Language")

        // JSON Body

        let bodyObject: [String : Any] = [
            "name": name ?? collection.name,
            "description": description ?? collection.name
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw HTTPError.badResponse
        }

        let json = try JSON(data: data)

        guard let createdAt = Date.create(mobbin: json["createdAt"].stringValue) else {
            throw MobbinError.wrongDate(json["createdAt"].stringValue)
        }
        guard let updatedAt = Date.create(mobbin: json["updatedAt"].stringValue) else {
            throw MobbinError.wrongDate(json["updatedAt"].stringValue)
        }
        let name = json["name"].stringValue
        let description = json["description"].stringValue

        return Collection(name: name, id: collection.id, description: description, updatedAt: updatedAt, createdAt: createdAt)
    }
}
