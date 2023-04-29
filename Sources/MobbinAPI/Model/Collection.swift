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
    let description: String
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

    struct Flow: Codable {
        struct Screen: Codable {
            let id: String
            let order: Int
            let hotspotType: String?
            let hotspotX: Double?
            let hotspotY: Double?
            let hotspotWidth: Double?
            let hotspotHeight: Double?
            let screenID: String
            let screenElements: [String]
            let screenPatterns: [String]
            let screenURL: URL
        }

        let id: String
        let name: String
        let actions: [String]
        let order: Int
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
        let collectionID: String
        let collectionAppSectionID: String
        let collectionAppSectionUpdatedAt: Date
        let screens: [Screen]
    }
}
