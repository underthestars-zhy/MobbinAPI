//
//  Flow.swift
//  
//
//  Created by 朱浩宇 on 2023/4/28.
//

import Foundation

struct Flow {
    let id: String
    let name: String
    let actions: [String]
    let parentAppSectionId: String?
    let order: Int
    let updatedAt: Date
    let appVersionId: String
    let screens: [Screen]

    struct Screen {
        let appScreenId: String
        let order: Int
        let hotspotWidth: Double?
        let hotspotHeight: Double?
        let hotspotX: Double?
        let hotspotY: Double?
        let hotspotType: String?
        let screenUrl: URL
    }
}
