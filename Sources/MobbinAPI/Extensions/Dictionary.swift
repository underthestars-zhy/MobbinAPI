//
//  Dictionary.swift
//  
//
//  Created by 朱浩宇 on 2023/4/27.
//

import Foundation

protocol URLQueryParameterStringConvertible {
  var queryParameters: String {get}
}

extension Dictionary : URLQueryParameterStringConvertible {
  /**
   This computed property returns a query parameters string from the given NSDictionary. For
   example, if the input is @{@"day":@"Tuesday", @"month":@"January"}, the output
   string will be @"day=Tuesday&month=January".
   @return The computed parameters string.
  */
  var queryParameters: String {
      var parts: [String] = []
      for (key, value) in self {
          let part = String(format: "%@=%@",
              String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
              String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
          parts.append(part as String)
      }
      return parts.joined(separator: "&")
  }
}
