//
//  ConnectionClass.swift
//  TringappsDemo
//
//  Created by Zencode Developer on 19/12/19.
//  Copyright © 2019 Zencode Developer. All rights reserved.
//

import Foundation
import UIKit


final class ConnectionManager {
    
    private static var sharedConnection: ConnectionManager = {
        let connection = ConnectionManager()
        return connection
    }()
    
    public static func shared() -> ConnectionManager {
        return sharedConnection
    }
    
    lazy var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            decoder.dateDecodingStrategy = .iso8601
        }
        return decoder
    }()
    
    typealias ResponseHandler<T: Codable> = ((_ data: T?, _ error: Error?) -> Void)
    
    private init() {}
    
}

extension ConnectionManager {
    
    func apiCall<T: Codable>(with apitarget: APITarget, CodableResponse: T.Type, completionHandler: @escaping ResponseHandler<T>)  {
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: apitarget.requestURL) { (data, response, error) in
            
            if let error = error {
                completionHandler(nil, error)
                return
            }
            if let data = data {
                do {
                    let decoded = try self.jsonDecoder.decode(T.self, from: data)
                    completionHandler(decoded, nil)
                } catch {
                    completionHandler(nil, error)
                }
            }
        }
        dataTask.resume()
    }
}
