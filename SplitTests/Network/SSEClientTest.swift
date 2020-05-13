//
// SSEClientTest.swift
// Split
//
// Created by Javier L. Avrudsky on 12/05/2020.
// Copyright (c) 2020 Split. All rights reserved.
//

import Foundation
import XCTest
@testable import Split

class SSEClientTest: XCTestCase {
    var httpClient: HttpClient?

    override func setUp() {

    }

    func test() {
        let url = URL(string: "https://split-realtime.ably.io/sse")
        let target = DynamicTarget(u)
        let r = httpClient?.sendRequest(target: <#T##Target##Split.Target#>)
    }
}