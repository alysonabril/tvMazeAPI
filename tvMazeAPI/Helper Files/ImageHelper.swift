//
//  ImageHelper.swift
//  tvMazeAPI
//
//  Created by Alyson Abril on 10/8/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import Foundation
import UIKit

class ImageHelper {
    private init () {}
    static let shared = ImageHelper()
    func getThumbnails(with num: Int,completionHandler: @escaping (Result<UIImage,AppError>) -> ()) {
        
        var numString = String()
        
        switch String(num).count {
        case 1:
            numString = "00\(num)"
        case 2:
            numString = "0\(num)"
        default:
            numString = "\(num)"
        }
        
        let urlString =
        "http://www.theodoregray.com/periodictable/Tiles/\(numString)/s7.JPG"
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        NetworkHelper.manager.performDataTask(endPointURL: url, httpMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let imageData):
                if let image = UIImage(data: imageData) {
                    completionHandler(.success(image))
                } else {
                    completionHandler(.failure(.notAnImage))
                }
            }
        }
    }
    
    func getFullImage(with name: String, completionHandler: @escaping (Result<UIImage,AppError>) -> ()) {
        let urlString = "http://images-of-elements.com/\(name.lowercased()).jpg"
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        
        NetworkHelper.manager.performDataTask(endPointURL: url, httpMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let imageData):
                if let image = UIImage(data: imageData) {
                    completionHandler(.success(image))
                } else {
                    completionHandler(.failure(.notAnImage))
                }
            }
        }
    }
}
