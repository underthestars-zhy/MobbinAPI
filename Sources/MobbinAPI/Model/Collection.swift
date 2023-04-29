//
//  Collection.swift
//  
//
//  Created by 朱浩宇 on 2023/4/29.
//

import Foundation

struct Collection {
    let name: String
    let id: String
    let updatedAt: Date
    let createdAt: Date

    struct App {
        let id: String
        let appName: String
        let appCategory: String
        let appStyle: String?
        let appLogoURL: URL
        let appTagline: String
        let companyHqRegion: String
        let companyStage: String
        let platform: String
        let createdAt: Date
        let appVersionID: String
        let appVersionCreatedAt: Date
        let appVersionUpdatedAt: Date
        let appVersionPublishedAt: Date
        let collectionAppID: String
        let collectionID: String
        let collectionAppCreatedAt: Date
        let collectionAppUpdatedAt: Date
        let previewScreenUrls: [URL]
    }

    struct Screen {
        let id: String
        let appID: String
        let appName: String
        let appCategory: String
        let appStyle: String?
        let appLogoURL: URL
        let appTagline: String
        let companyHqRegion: String
        let companyStage: String
        let platform: String
        let appVersionID: String
        let appVersionCreatedAt: Date
        let appVersionUpdatedAt: Date
        let appVersionPublishedAt: Date
        let screenNumber: Int
        let screenElements: [String]
        let screenPatterns: [String]
        let screenURL: URL
        let createdAt: Date
        let updatedAt: Date
        let collectionID: String
        let collectionAppScreenID: String
        let collectionAppScreenUpdatedAt: Date
    }
}
