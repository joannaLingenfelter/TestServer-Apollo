//
//  Network.swift
//  TestGraphQLServer-Apollo
//
//  Created by Joanna Lingenfelter on 8/31/22.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "http://localhost:4000/")!)
}
