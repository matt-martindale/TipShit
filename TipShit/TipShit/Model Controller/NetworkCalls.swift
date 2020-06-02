//
//  NetworkCalls.swift
//  TipShit
//
//  Created by Matthew Martindale on 6/1/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation
import CoreData

enum NetworkError: Error {
    case noIdentifier
    case otherError
    case noData
    case noDecode
    case noEncode
    case noRep
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

class NetworkCalls {
    
    typealias CompletionHandler = (Result<[Tip], NetworkError>) -> Void
    typealias errorCompletionHandler = (Error?) -> Void
    
    let baseURL = URL(string: "https://tipsandgiggles-e0a81.firebaseio.com/")!
    
    func fetchTipsFromServer(completion: @escaping (Result<[TipRepresentation], NetworkError>) -> Void) {
        let requestURL = baseURL.appendingPathExtension("json")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error GETTING tips from server: \(error)")
                completion(.failure(.otherError))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let tips = try JSONDecoder().decode([String : TipRepresentation].self, from: data).map { $0.value }
                completion(.success(tips))
            } catch {
                NSLog("Error decoding TipRepresentation: \(error)")
                completion(.failure(.noDecode))
            }
        }
        dataTask.resume()
    }
    
}
