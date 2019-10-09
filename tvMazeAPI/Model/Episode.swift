//
//  Episode.swift
//  tvMazeAPI
//
//  Created by Alyson Abril on 10/9/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import Foundation

struct Episode: Codable {
    let name: String
    let season: Int
    let episodeNumber: Int
    let image: Image
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case season
        case episodeNumber = "number"
        case image
    }
    
    static func getEpisodes(url: URL,completionHandler: @escaping (Result<[Episode],AppError>) -> ()) {
        NetworkHelper.manager.performDataTask(endPointURL: url, httpMethod:.get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let dataFromUrl):
                do {
                    let shows = try JSONDecoder().decode([Episode].self, from: dataFromUrl)
                    completionHandler(.success(shows))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}

struct Image: Codable {
    let medium: String
}
