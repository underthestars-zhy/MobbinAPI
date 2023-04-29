//
//  FlowTreeStructure.swift
//  
//
//  Created by 朱浩宇 on 2023/4/29.
//

import Foundation

extension MobbinAPI {
    func generateTreeSturctureFlow(from flows: [Flow], parent: String? = nil) -> [Tree<Flow>] {
        let topLevelFlows = flows.filter {
            $0.parentAppSectionId == parent
        }

        var res = [Tree<Flow>]()

        for topLevelFlow in topLevelFlows {
            let secondLevelFlows = flows.filter {
                $0.parentAppSectionId == topLevelFlow.id
            }.map { flow in
                Tree<Flow>.children(flow, generateTreeSturctureFlow(from: flows, parent: flow.id))
            }

            res.append(.children(topLevelFlow, secondLevelFlows))
        }

        return res
    }
}
