//
//  GenericSingleton.swift
//  DBTesting
//
//  Created by Abhishek Kumar Singh on 17/01/23.
//

import Foundation

class GenericSingleton {
    private var leResponseString: String = ""
    
    private init() {
        let responseUrl = Bundle.main.url(forResource: "NewHomeResponse", withExtension: "json")
        if let _responseUrl = responseUrl {
            do {
                let responseData = try Data(contentsOf: _responseUrl)
                leResponseString = String(data: responseData, encoding: .utf8) ?? ""
            } catch {
                
            }
        }
    }
    
    static let sharedInstance = GenericSingleton()
    
    public func getLEResponseString() -> String {
        return leResponseString
    }
}
