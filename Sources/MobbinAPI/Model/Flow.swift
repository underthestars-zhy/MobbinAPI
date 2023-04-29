//
//  Flow.swift
//  
//
//  Created by 朱浩宇 on 2023/4/28.
//

import Foundation

public struct Flow {
    public let id: String
    public let name: String
    public let actions: [String]
    public let parentAppSectionId: String?
    public let order: Int
    public let updatedAt: Date
    public let appVersionId: String
    public let screens: [Screen]

    public struct Screen {
        public let appScreenId: String
        public let order: Int
        public let hotspotWidth: Double?
        public let hotspotHeight: Double?
        public let hotspotX: Double?
        public let hotspotY: Double?
        public let hotspotType: String?
        public let screenUrl: URL
    }
}
