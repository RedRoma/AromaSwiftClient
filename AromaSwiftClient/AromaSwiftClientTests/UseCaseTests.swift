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

    private let tokenId = "6c2a0886-6a96-40c7-99f2-711fb8bdebf0"

    private let title = "Unit Test Ran"

    override func setUp() {
        super.setUp()

        AromaClient.TOKEN_ID = tokenId
        AromaClient.maxConcurrency = 1
    }

    func testAroma() {

        print("Sending Message")

        let onError: AromaClient.OnFail = { ex in
            print("Failed to send Message: \(ex)")
            XCTFail("Could not send message: \(ex)")
        }
        let onDone: AromaClient.OnDone = {
            print("Successfully sent message")
        }

        let date = NSDate()

        AromaClient.beginwithTitle(title)
            .addBody("Sending a test message as part of the unit test")
            .addLine().addLine()
            .addBody("Todays Date is \(date)")
            .withPriority(.LOW)
            .send(onDone, onError: onError)

    }

}
