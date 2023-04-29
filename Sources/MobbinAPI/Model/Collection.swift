//
//  Collection.swift
//  
//
//  Created by 朱浩宇 on 2023/4/29.
//

import Foundation

public struct Collection {
    public let name: String
    public let id: String
    public let description: String
    public let updatedAt: Date
    public let createdAt: Date

    public struct App {
        public let id: String
        public let appName: String
        public let appCategory: String
        public let appStyle: String?
        public let appLogoURL: URL
        public let appTagline: String
        public let companyHqRegion: String
        public let companyStage: String
        public let platform: String
        public let createdAt: Date
        public let appVersionID: String
        public let appVersionCreatedAt: Date
        public let appVersionUpdatedAt: Date
        public let appVersionPublishedAt: Date
        public let collectionAppID: String
        public let collectionID: String
        public let collectionAppCreatedAt: Date
        public let collectionAppUpdatedAt: Date
        public let previewScreenUrls: [URL]
    }

    public struct Screen {
        public let id: String
        public let appID: String
        public let appName: String
        public let appCategory: String
        public let appStyle: String?
        public let appLogoURL: URL
        public let appTagline: String
        public let companyHqRegion: String
        public let companyStage: String
        public let platform: String
        public let appVersionID: String
        public let appVersionCreatedAt: Date
        public let appVersionUpdatedAt: Date
        public let appVersionPublishedAt: Date
        public let screenNumber: Int
        public let screenElements: [String]
        public let screenPatterns: [String]
        public let screenURL: URL
        public let createdAt: Date
        public let updatedAt: Date
        public let collectionID: String
        public let collectionAppScreenID: String
        public let collectionAppScreenUpdatedAt: Date
    }

    public struct Flow: Codable {
        public struct Screen: Codable {
            public let id: String
            public let order: Int
            public let hotspotType: String?
            public let hotspotX: Double?
            public let hotspotY: Double?
            public let hotspotWidth: Double?
            public let hotspotHeight: Double?
            public let screenID: String
            public  let screenElements: [String]
            public let screenPatterns: [String]
            public let screenURL: URL
        }

        public let id: String
        public let name: String
        public let actions: [String]
        public let order: Int
        public let appID: String
        public let appName: String
        public let appCategory: String
        public let appStyle: String?
        public let appLogoURL: URL
        public let appTagline: String
        public let companyHqRegion: String
        public let companyStage: String
        public let platform: String
        public let appVersionID: String
        public let appVersionCreatedAt: Date
        public let appVersionUpdatedAt: Date
        public let appVersionPublishedAt: Date
        public let collectionID: String
        public let collectionAppSectionID: String
        public let collectionAppSectionUpdatedAt: Date
        public let screens: [Screen]
    }
}
