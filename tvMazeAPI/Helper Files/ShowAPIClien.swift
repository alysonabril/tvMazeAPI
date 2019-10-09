//
//  ShowAPIClien.swift
//  tvMazeAPI
//
//  Created by Alyson Abril on 10/8/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import Foundation

final class ShowAPIClient {
    
    private init () {}
    
    static let shared = ShowAPIClient()
    
    func getShows(completionHandler: @escaping (Result<[ShowResults],AppError>) -> ()) {
        let urlString = "http://api.tvmaze.com/search/shows?q=girls"
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        ShowResults.getShows(url: url){ (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let showsFromJSON):
                completionHandler(.success(showsFromJSON))
            }
        }
    }
}
