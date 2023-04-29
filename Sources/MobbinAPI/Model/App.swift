//
//  App.swift
//  
//
//  Created by 朱浩宇 on 2023/4/27.
//

import Foundation

public struct App {
    public let id: String
    public let appName: String
    public let appCategory: String
    public let appStyle: String?
    public let appLogoUrl: URL
    public let appTagline: String
    public let companyHqRegion: String
    public let companyStage: String
    public let platform: String
    public let createdAt: Date
    public let appVersionId: String
    public let appVersionCreatedAt: Date
    public let appVersionUpdatedAt: Date
    public let appVersionPublishedAt: Date
    public let previewScreenUrls: [URL]
}
