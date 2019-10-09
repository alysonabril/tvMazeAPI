//
//  Model.swift
//  tvMazeAPI
//
//  Created by Alyson Abril on 9/12/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import Foundation

struct ShowResults: Codable {
    let show: Show
    
    static func getShow(fromData: Data) throws -> [ShowResults]{
        var allShows = [ShowResults]()
        do {
            let showInfo = try JSONDecoder().decode([ShowResults].self, from: fromData)
            allShows = showInfo
            return allShows
        } catch {
            print(error)
            return allShows
        }
    }
    
}

struct Show: Codable {
    let id: Int
    let name: String
    //let genres: [String]
    let rating: Rating?
    let image: ImageWrapper
}

struct Rating: Codable {
    let average: Double?
}


struct ImageWrapper: Codable {
    let medium: String
    let original: String
}