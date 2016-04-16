//
//  AromaSwiftClientTests.swift
//  AromaSwiftClientTests
//
//  Created by Juan Wellington Moreno on 4/4/16.
//  Copyright © 2016 RedRoma, Inc. All rights reserved.
//

import XCTest
@testable import AromaSwiftClient

let TEST_TOKEN_ID = "6c2a0886-6a96-40c7-99f2-711fb8bdebf0"

class AromaSwiftClientTests: XCTestCase {
    
    private var message: AromaRequest!
    
    private dynamic var isDone = false
   

    override func setUp() {
        super.setUp()
        
        message = AromaRequest()
        message.title = "some title"
        message.body = "some body"
        message.priority = .LOW
        
        isDone = false
        
        testDefaultValues()
        AromaClient.TOKEN_ID = TEST_TOKEN_ID
    }

    override func tearDown() {
        super.tearDown()
        
        AromaClient.TOKEN_ID = ""
    }

    private func testDefaultValues() {
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

        AromaClient.send(message, onError: onError, onDone: onDone)

        while !isDone { }
    }

    func testBeginWithTitle() {
        let result = AromaClient.beginWithTitle(message.title)
        XCTAssertNotNil(result)
    }
    
    func testSendHighPriorityMessage() {
        
        AromaClient.sendHighPriorityMessage(withTitle: "High Priority Test", withBody: message.body, onError: onError, onDone: onDone)
        
        while !isDone { }
    }
    
    func testSendMediumPriorityMessage() {
        
        AromaClient.sendMediumPriorityMessage(withTitle: "Medium Priority Test", onError: onError, onDone: onDone)
        
        while !isDone { }
    }
    
    func testSendLowPriorityMessage() {
        
        AromaClient.sendLowPriorityMessage(withTitle: "Low Priority Test", onError: onError, onDone: onDone)
        
        while !isDone { }
    }
    
    private func onError(ex: ErrorType) {
        XCTFail("Failed to send message: \(ex)")
    }
    
    private func onDone() {
        print("Message sent!")
        
        self.isDone = true
    }
}
