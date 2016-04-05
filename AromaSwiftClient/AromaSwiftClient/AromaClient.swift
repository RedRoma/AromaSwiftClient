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


class AromaClient {
    
    public typealias OnDone = (Aroma_Message) -> Void
    public typealias OnFail = (NSError) -> Void
    
    private let async = NSOperationQueue()
    private let main = NSOperationQueue.mainQueue()
    
    private var body: String?
    private var title: String?
    
    private let device = UIDevice.currentDevice().name
    
    init() {
        async.maxConcurrentOperationCount = 1
    }
    
    public func send() {
        
        guard let title = title else { return }
        
        async.addOperationWithBlock() {
        
            do {
                try tryOp() {
                    
                }
            }
            catch let ex {
                
            }
            
        }
    }
}