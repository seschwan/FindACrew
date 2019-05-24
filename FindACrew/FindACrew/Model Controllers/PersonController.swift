//
//  PersonController.swift
//  FindACrew
//
//  Created by Seschwan on 5/23/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

class PersonController {
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    var people: [Person] = []
    
    let baseURL = URL(string: "https://swapi.co/api/people")!
    
    func searchForPeopleWith(searchTerm: String, completion: @escaping () -> Void) {
        
        var urlComponets = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let searchTermQueryItem = URLQueryItem(name: "search", value: searchTerm)
        
        urlComponets?.queryItems = [searchTermQueryItem]
        
        guard let requestURL = urlComponets?.url else { NSLog("request is nil"); completion(); return }
        
        var request = URLRequest(url: requestURL)
        
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error fething data \(error)")
                completion()
                return
            }
            
            guard let data = data else {
                NSLog("No data returned from data task")
                completion()
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let personSearch = try jsonDecoder.decode(PersonSearch.self, from: data)
                self.people = personSearch.results
            } catch {
                NSLog("Unable to decode data into object of type [Person]: \(error)")
            }
            
            completion()
        }.resume()
        
        
    }
    
}
