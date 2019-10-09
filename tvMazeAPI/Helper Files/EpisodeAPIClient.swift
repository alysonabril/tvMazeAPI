//
//  EpisodeAPIClient.swift
//  tvMazeAPI
//
//  Created by Alyson Abril on 10/9/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import Foundation

final class EpisodeAPIClient {
    
    private init () {}
    
    static let shared = EpisodeAPIClient()
    
    func getEpisodes(id: Int, completionHandler: @escaping (Result<[Episode],AppError>) -> ()) {
        let urlString = "http://api.tvmaze.com/shows/\(id)/episodes"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        Episode.getEpisodes(url: url){ (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let episodesFromJSON):
                completionHandler(.success(episodesFromJSON))
            }
        }
    }
}
