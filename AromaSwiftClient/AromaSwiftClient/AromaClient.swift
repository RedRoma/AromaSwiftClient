//
//  AromaClient.swift
//  AromaSwiftClient
//
//  Created by Juan Wellington Moreno on 4/4/16.
//  Copyright © 2016 RedRoma, Inc. All rights reserved.
//

import AromaThrift
import Foundation
import SwiftExceptionCatcher


public class AromaClient {
    
    public typealias OnDone = () -> Void
    public typealias OnFail = (ErrorType) -> Void
    
    //Endpoint management
    private static let DEFAULT_ENDPOINT = ApplicationService_ApplicationServiceConstants.PRODUCTION_ENDPOINT()
    public static var hostname = DEFAULT_ENDPOINT.hostname
    public static var port = UInt32(DEFAULT_ENDPOINT.port)
    
    //Async and Threading
    private static let async = NSOperationQueue()
    private static let main = NSOperationQueue.mainQueue()
    public static var maxConcurrency: Int = 1 {
        didSet {
            if maxConcurrency >= 1 {
                async.maxConcurrentOperationCount = maxConcurrency
            }
        }
    }
    
    public static var TOKEN_ID: String = ""
    

    static func createThriftClient() -> ApplicationService_ApplicationService {
        
        let tTransport = TSocketClient(hostname: AromaClient.hostname, port: AromaClient.port)
        let tProtocol = TBinaryProtocol(transport: tTransport)
        
        return ApplicationService_ApplicationServiceClient(withProtocol: tProtocol)
    }
    
    
    public static func send(message: AromaRequest, onDone: AromaClient.OnDone? = nil, onError: AromaClient.OnFail? = nil) {
        
        guard !message.title.isEmpty else {
            onDone?()
            return
        }
        
        let request = message.createRequestObject()
        let client = createThriftClient()
        
        do {
            let _ = try tryOp() { client.sendMessage(request) }
            //Message successfully sent
            
            if let callback = onDone {
                AromaClient.main.addOperationWithBlock() { callback() }
            }
        }
        catch let ex {
            
            print("Failed to send AromaMessage \(message) : \(ex)")
            
            if let callback = onError {
                AromaClient.main.addOperationWithBlock() { callback(ex) }
            }
        }
        
    }

   
    
}