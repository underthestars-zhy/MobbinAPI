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
}
