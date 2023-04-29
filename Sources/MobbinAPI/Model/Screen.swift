//
//  Screen.swift
//  
//
//  Created by 朱浩宇 on 2023/4/27.
//

import Foundation

public struct Screen {
    public let screenNumber: Int
    public let screenUrl: URL
    public let appVersionId: String
    public let id: String
    public let screenElements: [String]
    public let screenPatterns: [String]
    public let updatedAt: Date
    public let createdAt: Date
}
