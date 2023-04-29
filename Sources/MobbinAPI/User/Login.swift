//
//  Login.swift
//  
//
//  Created by 朱浩宇 on 2023/4/26.
//

import Foundation
import SwiftyJSON

extension MobbinAPI {
    func shoudUsePassword() async throws -> Bool {
        guard let URL = URL(string: "https://ujasntkfphywizsdaapi.supabase.co/rest/v1/rpc/get_should_use_password_for_email") else { throw HTTPError.wrongUrlFormat }
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"

        // Headers

        request.addValue("ujasntkfphywizsdaapi.supabase.co", forHTTPHeaderField: "Host")
        request.addValue("keep-alive", forHTTPHeaderField: "Connection")
        request.addValue("supabase-js/1.35.7", forHTTPHeaderField: "X-Client-Info")
        request.addValue("\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"", forHTTPHeaderField: "sec-ch-ua")
        request.addValue("?0", forHTTPHeaderField: "sec-ch-ua-mobile")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYyNTQ2MDM3NSwiZXhwIjoxOTQxMDM2Mzc1fQ.IgHG-M4znmVhQEa6uWWb3gz-_XXjsSvPPF8NBad8gvk", forHTTPHeaderField: "Authorization")
        request.addValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.0.0", forHTTPHeaderField: "User-Agent")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
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
            "target_email": email
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw HTTPError.badResponse
        }

        return try JSONDecoder().decode(Bool.self, from: data)
    }

    func sendEmail() async throws {
        guard try await !shoudUsePassword() else { throw MobbinError.emailProblem }

        guard let URL = URL(string: "https://ujasntkfphywizsdaapi.supabase.co/auth/v1/otp") else { throw HTTPError.wrongUrlFormat }
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"

        // Headers

        request.addValue("ujasntkfphywizsdaapi.supabase.co", forHTTPHeaderField: "Host")
        request.addValue("keep-alive", forHTTPHeaderField: "Connection")
        request.addValue("supabase-js/1.35.7", forHTTPHeaderField: "X-Client-Info")
        request.addValue("\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"", forHTTPHeaderField: "sec-ch-ua")
        request.addValue("?0", forHTTPHeaderField: "sec-ch-ua-mobile")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYyNTQ2MDM3NSwiZXhwIjoxOTQxMDM2Mzc1fQ.IgHG-M4znmVhQEa6uWWb3gz-_XXjsSvPPF8NBad8gvk", forHTTPHeaderField: "Authorization")
        request.addValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.0.0", forHTTPHeaderField: "User-Agent")
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

        let bodyString = "{\"email\":\"\(email)\",\"create_user\":true,\"gotrue_meta_security\":{}}"
        request.httpBody = bodyString.data(using: .utf8, allowLossyConversion: true)

        let (_, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw HTTPError.badResponse
        }
    }

    func verify(code: String) async throws -> Bool {
        guard let URL = URL(string: "https://ujasntkfphywizsdaapi.supabase.co/auth/v1/verify") else { throw HTTPError.wrongUrlFormat }
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"

        // Headers

        request.addValue("ujasntkfphywizsdaapi.supabase.co", forHTTPHeaderField: "Host")
        request.addValue("keep-alive", forHTTPHeaderField: "Connection")
        request.addValue("supabase-js/1.35.7", forHTTPHeaderField: "X-Client-Info")
        request.addValue("\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"", forHTTPHeaderField: "sec-ch-ua")
        request.addValue("?0", forHTTPHeaderField: "sec-ch-ua-mobile")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYyNTQ2MDM3NSwiZXhwIjoxOTQxMDM2Mzc1fQ.IgHG-M4znmVhQEa6uWWb3gz-_XXjsSvPPF8NBad8gvk", forHTTPHeaderField: "Authorization")
        request.addValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.0.0", forHTTPHeaderField: "User-Agent")
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

        let bodyString = "{\"email\":\"\(email)\",\"token\":\"\(code)\",\"type\":\"magiclink\"}"
        request.httpBody = bodyString.data(using: .utf8, allowLossyConversion: true)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw HTTPError.badResponse
        }

        let json = try JSON(data: data)

        self.token = Token(accessToken: json["access_token"].stringValue, refreshToken: json["refresh_token"].stringValue)

        guard let userInfo = UserInfo(id: json["user"]["id"].stringValue, aud: json["user"]["aud"].stringValue, role: json["user"]["role"].stringValue, email: json["user"]["email"].stringValue, emailConfirmedAt: json["user"]["email_confirmed_at"].stringValue, recoverySentAt: json["user"]["recovery_sent_at"].stringValue, lastSignInAt: json["user"]["last_sign_in_at"].stringValue, avatarUrl: json["user"]["user_metadata"]["avatar_url"].stringValue, fullName: json["user"]["user_metadata"]["full_name"].stringValue) else {
            return false
        }

        self.userInfo = userInfo

        return true
    }
}
