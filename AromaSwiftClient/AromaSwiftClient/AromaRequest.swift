//
//  AromaRequest.swift
//  AromaSwiftClient
//
//  Created by Juan Wellington Moreno on 4/6/16.
//  Copyright © 2016 RedRoma, Inc. All rights reserved.
//

import AromaThrift
import Foundation
import SwiftExceptionCatcher

public struct AromaRequest : Equatable {

    public enum Urgency: UInt32 {
        case LOW
        case MEDIUM
        case HIGH
        
        func toThrift() -> UInt32 {
            switch self {
            case .LOW : return Urgency_LOW.rawValue
            case .MEDIUM : return Urgency_MEDIUM.rawValue
            case .HIGH : return Urgency_HIGH.rawValue
            }
        }
    }
    
    
    //MARK: Public properties
    public var title: String = ""
    public var body: String? = ""
    public var urgency: AromaRequest.Urgency = .LOW
    public var deviceName = UIDevice.currentDevice().name
   
    
}


public func == (lhs: AromaRequest, rhs: AromaRequest) -> Bool {
    
    if !equals(lhs.title, right: rhs.title) {
        return false
    }
    
    if !equals(lhs.body, right: rhs.body) {
        return false
    }
    
    if !equals(lhs.urgency, right: rhs.urgency) {
        return false
    }
    
    if !equals(lhs.deviceName, right: rhs.deviceName) {
        return false
    }
    
    return true
}

func equals<T:Equatable> (left: T?, right: T?) -> Bool {
    
    if let left = left, let right = right {
        return left == right
    }
    
    return left == nil && right == nil
    
}

//MARK: Public APIs
extension AromaRequest {
    
    public func withBody(body: String) -> AromaRequest {
        return AromaRequest(title: title, body: body, urgency: urgency, deviceName: deviceName)
    }
    
    public func withDeviceName(deviceName: String) -> AromaRequest {
        return AromaRequest(title: title, body: body, urgency: urgency, deviceName: deviceName)
    }
    
    public func withTitle(title: String) -> AromaRequest {
        return AromaRequest(title: title, body: body, urgency: urgency, deviceName: deviceName)
    }
    
    public func withUrgency(urgency: AromaRequest.Urgency) -> AromaRequest {
        return AromaRequest(title: title, body: body, urgency: urgency, deviceName: deviceName)
    }
    
    public func send(onDone: AromaClient.OnDone? = nil, onError: AromaClient.OnFail? = nil) {
        AromaClient.send(self, onDone: onDone, onError: onError)
    }
}