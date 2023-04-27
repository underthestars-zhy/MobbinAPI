//
//  URL.swift
//  
//
//  Created by 朱浩宇 on 2023/4/27.
//

import Foundation

extension URL {
  /**
   Creates a new URL by adding the given query parameters.
   @param parametersDictionary The query parameter dictionary to add.
   @return A new URL.
  */
  func appendingQueryParameters(_ parametersDictionary : Dictionary<String, String>) -> URL {
      let URLString : String = String(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
      return URL(string: URLString)!
  }
}
