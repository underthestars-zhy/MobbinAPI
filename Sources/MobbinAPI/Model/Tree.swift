//
//  Tree.swift
//  
//
//  Created by 朱浩宇 on 2023/4/29.
//

import Foundation

public enum Tree<Item> {
    case children(Item, [Self])
}
