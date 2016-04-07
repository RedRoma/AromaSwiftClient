//
//  AromaRequestTests.swift
//  AromaSwiftClient
//
//  Created by Juan Wellington Moreno on 4/6/16.
//  Copyright © 2016 RedRoma, Inc. All rights reserved.
//

import XCTest
@testable import AromaSwiftClient

class AromaRequestTests: XCTestCase {
    
    private var instance: AromaRequest!
    
    override func setUp() {
        super.setUp()
        
        instance = AromaRequest()
        
        instance.title = "message title"
        instance.body = "some body"
        instance.urgency = .LOW
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testWithTitle() {
        guard let instance = instance else { return }
        
        let newTitle = "new title"
        let result = instance.withTitle(newTitle)
        
        XCTAssert(result.title == newTitle)
        XCTAssert(result.body == instance.body)
        XCTAssert(result.urgency == instance.urgency)
        XCTAssert(result.deviceName == instance.deviceName)
        XCTAssert(result != instance)
    
    }
   
    func testWithBody() {
        
        let newBody = "new Body"
        let result = instance.withBody(newBody)
        
        XCTAssert(result.body == newBody)
        XCTAssert(result.title == instance.title)
        XCTAssert(result.deviceName == instance.deviceName)
        XCTAssert(result.urgency == instance.urgency)
        XCTAssert(result != instance)
    }
    
    func testWithDeviceName() {
        
        let newDevice = "new Device"
        let result = instance.withDeviceName(newDevice)
        
        XCTAssert(result.deviceName == newDevice)
        XCTAssert(result.body == instance.body)
        XCTAssert(result.title == instance.title)
        XCTAssert(result.urgency == instance.urgency)
        XCTAssert(result != instance)
    }
    
    func testWithUrgency() {
        
        let newUrgecy: AromaRequest.Urgency = .HIGH
        let result = instance.withUrgency(newUrgecy)
        
        XCTAssert(result.urgency == newUrgecy)
        XCTAssert(result.title == instance.title)
        XCTAssert(result.body == instance.body)
        XCTAssert(result.deviceName == instance.deviceName)
        XCTAssert(result != instance)
    }
}
