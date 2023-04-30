//
//  DownloadURL.swift
//  
//
//  Created by 朱浩宇 on 2023/4/30.
//

import Foundation
import SwiftyJSON

extension MobbinAPI {
    func downloadURL(of app: App, mobbinToken: String? = nil) async throws -> URL {
        let json = try await mobbinAppInfo(of: app, mobbinToken: mobbinToken)

        guard let url = json["pageProps"]["app"]["appStoreUrl"].url else { throw MobbinError.wrongURL(json["pageProps"]["app"]["appStoreUrl"].stringValue) }

        return url
    }
}
