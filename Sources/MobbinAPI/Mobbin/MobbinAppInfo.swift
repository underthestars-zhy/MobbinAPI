//
//  MobbinAppInfo.swift
//  
//
//  Created by 朱浩宇 on 2023/4/30.
//

import Foundation
import SwiftyJSON

extension MobbinAPI {
    func mobbinAppInfo(of app: App, mobbinToken: String?) async throws -> JSON {
        let token: String

        if let mobbinToken {
            token = mobbinToken
        } else {
            token = try await getMobbinQueryToken()
        }

        guard var URL = URL(string: "https://mobbin.com/_next/data/\(token)/apps/\(app.appName.lowercased().replacing(" ", with: "-"))-\(app.platform)-\(app.id)/_/screens.json") else {
            throw HTTPError.wrongUrlFormat }
        let URLParams = [
            "appSlug": "\(app.appName.lowercased().replacing(" ", with: "-"))-\(app.platform)-\(app.id),_,screens",
        ]

        URL = URL.appendingQueryParameters(URLParams)
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw HTTPError.badResponse
        }

        let json = try JSON(data: data)

        if let redirect = json["pageProps"]["__N_REDIRECT"].url {
            guard let redirectURL = Foundation.URL(string: "https://mobbin.com/_next/data/\(token)/apps/\(redirect.pathComponents[2])/_/screens.json") else { throw HTTPError.wrongUrlFormat }
            let (rData, rResponse) = try await URLSession.shared.data(from: redirectURL)

            guard let rHttpResponse = rResponse as? HTTPURLResponse, rHttpResponse.statusCode == 200 else {
                throw HTTPError.badResponse
            }

            return try JSON(data: rData)
        }

        return json
    }
}
