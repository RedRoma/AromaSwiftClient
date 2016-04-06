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

public struct AromaRequest {

    
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
    public var title: String
    public var body: String?
    public var urgency: AromaRequest.Urgency = .LOW
    public var deviceName = UIDevice.currentDevice().name
    
    //MARK: Private properties
    private var tokenId: String = AromaClient.TOKEN_ID
    
    private var appToken: ApplicationService_ApplicationToken? {
        
        guard !tokenId.isEmpty else { return nil }
        
        let token = ApplicationService_ApplicationToken()
        token.tokenId = self.tokenId
        return token
    }
  
    
    func createRequestObject() -> ApplicationService_SendMessageRequest {
        
        let request = ApplicationService_SendMessageRequest()
        request.applicationToken = self.appToken
        request.body = self.body
        request.title = self.title
        request.hostname = deviceName
        request.timeOfMessage = currentTimestamp
        
        return request
    }
    
    private var currentTimestamp: Aroma_timestamp {
        let now = NSDate()
        return Aroma_timestamp(now.timeIntervalSince1970 * 1000)
    }
    
}

//MARK: Public APIs
extension AromaRequest {
    
    public func withBody(body: String) -> AromaRequest {
        return AromaRequest(title: title, body: body, urgency: urgency, deviceName: deviceName, tokenId: tokenId)
    }
    
    public func withDeviceName(deviceName: String) -> AromaRequest {
        return AromaRequest(title: title, body: body, urgency: urgency, deviceName: deviceName, tokenId: tokenId)
    }
    
    public func withTitle(title: String) -> AromaRequest {
        return AromaRequest(title: title, body: body, urgency: urgency, deviceName: deviceName, tokenId: tokenId)
    }
    
    public func withUrgency(urgency: AromaRequest.Urgency) -> AromaRequest {
        return AromaRequest(title: title, body: body, urgency: urgency, deviceName: deviceName, tokenId: tokenId)
    }
    
    public func send(onDone: AromaClient.OnDone? = nil, onError: AromaClient.OnFail? = nil) {
        AromaClient.send(self, onDone: onDone, onError: onError)
    }
}