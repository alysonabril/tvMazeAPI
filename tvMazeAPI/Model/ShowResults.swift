//
//  Model.swift
//  tvMazeAPI
//
//  Created by Alyson Abril on 9/12/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import Foundation
import UIKit


struct ShowResults: Codable {
    let show: Show
    
     static func getShows(url: URL,completionHandler: @escaping (Result<[ShowResults],AppError>) -> ()) {
            NetworkHelper.manager.performDataTask(endPointURL: url, httpMethod:.get) { (result) in
                switch result {
                case .failure(let error):
                    completionHandler(.failure(error))
                case .success(let dataFromUrl):
                    do {
                        let shows = try JSONDecoder().decode([ShowResults].self, from: dataFromUrl)
                        completionHandler(.success(shows))
                    } catch {
                        completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                    }
                }
            }
        }

    }
    

struct Show: Codable {
    let id: Int
    let name: String
    let rating: Rating?
    let image: ImageWrapper?
}

struct Rating: Codable {
    let average: Double?
}


struct ImageWrapper: Codable {
    let medium: String
}
