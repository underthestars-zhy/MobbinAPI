//
//  MobbinQueryToken.swift
//  
//
//  Created by 朱浩宇 on 2023/4/30.
//

import Foundation

extension MobbinAPI {
    func getMobbinQueryToken() async throws -> String {
        guard let URL = URL(string: "https://mobbin.com/") else { throw MobbinError.cannotFindToken }
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw HTTPError.badResponse
        }

        if let bodyString = String(data: data, encoding: .utf8) {
            let regex = #/"buildId":"(?<token>[\w\d]+)"/#

            if let match = try regex.firstMatch(in: bodyString) {
                return String(match.token)
            }

        }

        throw MobbinError.cannotFindMobbinQueryToken
    }
}
