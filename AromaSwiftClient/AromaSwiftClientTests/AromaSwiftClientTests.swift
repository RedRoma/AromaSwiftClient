//
//  AromaSwiftClientTests.swift
//  AromaSwiftClientTests
//
//  Created by Juan Wellington Moreno on 4/4/16.
//  Copyright © 2016 RedRoma, Inc. All rights reserved.
//

import XCTest
@testable import AromaSwiftClient

class AromaSwiftClientTests: XCTestCase {

    private var message: AromaRequest!

    override func setUp() {
        super.setUp()
        message = AromaRequest()
        message.title = "some title"
        message.body = "some body"
        message.priority = .LOW
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDefaultValues() {
        XCTAssertNotNil(AromaClient.hostname)
        XCTAssertNotNil(AromaClient.port)
        XCTAssert(AromaClient.port > 0)

        XCTAssert(AromaClient.TOKEN_ID.isEmpty)
    }

    func testThriftClient() {
        let client = AromaClient.createThriftClient()
        XCTAssertNotNil(client)
    }

    func testMessageSend() {

        let onDone: AromaClient.OnDone = {
            print("Message sent!")
        }

        AromaClient.send(message, onDone: onDone)
    }

    func testBeginWithTitle() {
        let result = AromaClient.beginWithTitle(message.title)
        XCTAssertNotNil(result)
    }

}
