//
//  UseCaseTests.swift
//  AromaSwiftClient
//
//  Created by Juan Wellington Moreno on 4/6/16.
//  Copyright © 2016 RedRoma, Inc. All rights reserved.
//

import XCTest
import AromaSwiftClient

class UseCaseTests: XCTestCase {

    private let tokenId = TEST_TOKEN_ID

    private let title = "Unit Test Ran"

    override func setUp() {
        super.setUp()

        AromaClient.TOKEN_ID = tokenId
        AromaClient.maxConcurrency = 1
    }

    func testAroma() {

        print("Sending Message")

        let onError: AromaClient.OnError = { ex in
            print("Failed to send Message: \(ex)")
            XCTFail("Could not send message: \(ex)")
        }
        
        let onDone: AromaClient.OnDone = {
            print("Successfully sent message")
        }

        let date = NSDate()

        AromaClient.beginWithTitle(title)
            .addBody("Sending a test message as part of the unit test")
            .addLine().addLine()
            .addBody("Todays Date is \(date)")
            .withPriority(.LOW)
            .send(onDone, onError: onError)

    }

}
