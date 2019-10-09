import Foundation

enum AppError: Error {
    case badDJSONError
    case badURL
    case networkError
    case noDataError
    case badResponse
    case notFoundError // 404 status code
    case unauthorized // 403 and 401 status code
    case other (rawError:String)
    case badImage
}
