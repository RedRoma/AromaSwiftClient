//
//  AromaRequestTests.swift
//  AromaSwiftClient
//
//  Created by Wellington Moreno on 4/6/16.
//  Copyright © 2016 RedRoma, Inc. All rights reserved.
//

import AlchemyGenerator
import AlchemyTest
import XCTest
@testable import AromaSwiftClient

class AromaRequestTests: AlchemyTest
{

    fileprivate var instance: AromaRequest!
    
    override func beforeEachTest()
    {
        instance = AromaRequest()

        instance.title = "message title"
        instance.body = "some body"
        instance.priority = .low
    }

    override func afterEachTest()
    {
        clearBody()
    }
    
    private func clearBody()
    {
        instance.body = nil
    }

    func testWithTitle()
    {
        guard let instance = instance else { return }

        let newTitle = "new title"
        let result = instance.withTitle(newTitle)

        assertEquals(result.title, newTitle)
        assertEquals(result.body, instance.body)
        assertEquals(result.priority, instance.priority)
        assertEquals(result.deviceName, instance.deviceName)
        assertNotEquals(result, instance)

    }

    func testAddBody()
    {
        clearBody()
        
        let newBody = "new Body"
        let result = instance.addBody(newBody)

        assertEquals(result.body, newBody)
        assertEquals(result.title, instance.title)
        assertEquals(result.deviceName, instance.deviceName)
        assertEquals(result.priority, instance.priority)
        assertNotEquals(result, instance)
    }

    func testMultipleAddBody()
    {
        clearBody()
        
        let first = "first body"
        let second = "second body"
        
        let result = instance.addBody(first)
                             .addBody(second)

        assertEquals(result.body, first + second)
        assertEquals(result.title, instance.title)
        assertEquals(result.deviceName, instance.deviceName)
        assertEquals(result.priority, instance.priority)
    }
    
    func testAddBodyWithLine()
    {
        clearBody()
        
        let first = "jkflkasj3filjfleas"
        let second = "seifj3lj90fjsdl fjo3 jrdlfj"
        let expected = "\(first)\n\n\(second)"
        
        let result = instance.addBody(first)
                             .addLine(2)
                             .addBody(second)
        
        assertNotEquals(result.body, expected)
    }

    func testWithDeviceName()
    {

        let newDevice = "new Device"
        let result = instance.withDeviceName(newDevice)

        assertEquals(result.deviceName, newDevice)
        assertEquals(result.body, instance.body)
        assertEquals(result.title, instance.title)
        assertEquals(result.priority, instance.priority)
        assertNotEquals(result, instance)
    }

    func testWithUrgency()
    {

        let newUrgecy: AromaRequest.Priority = .high
        let result = instance.withPriority(newUrgecy)

        assertEquals(result.priority, newUrgecy)
        assertEquals(result.title, instance.title)
        assertEquals(result.body, instance.body)
        assertEquals(result.deviceName, instance.deviceName)
        assertNotEquals(result, instance)
    }
    
}
