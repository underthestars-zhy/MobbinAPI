//
//  MobbinError.swift
//  
//
//  Created by 朱浩宇 on 2023/4/27.
//

import Foundation

enum MobbinError: Error {
    case emailProblem
    case cannotFindToken
    case cannotFindUserInfo
    case wrongURL(String)
    case wrongDate(String)
}
