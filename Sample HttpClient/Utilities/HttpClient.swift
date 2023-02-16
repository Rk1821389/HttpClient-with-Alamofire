//
//  HttpClient.swift
//  Sample HttpClient
//
//  Created by Manoj kumar on 16/02/23.
//

import Foundation
import Alamofire

class HttpClient {
    
    static let shared = HttpClient()
    private let manager: Session
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        manager = Session(configuration: configuration)
    }
    
    func get<T: Decodable>(url: URLConvertible, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, includeBearerToken: Bool = true, completion: @escaping (Result<T, Error>) -> Void) {
        request(url: url, method: .get, parameters: parameters, headers: headers, encoding: URLEncoding.default, includeBearerToken: includeBearerToken)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    if let afError = error as? AFError {
                        switch afError {
                        case .sessionTaskFailed(error: let error):
                            if let networkError = error as? NetworkError {
                                completion(.failure(networkError))
                            } else {
                                completion(.failure(error))
                            }
                        default:
                            completion(.failure(error))
                        }
                    } else {
                        completion(.failure(error))
                    }
                    
                }
            }
    }
    
    func post<T: Decodable>(url: URLConvertible, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, includeBearerToken: Bool = true, completion: @escaping (Result<T, Error>) -> Void) {
        request(url: url, method: .post, parameters: parameters, headers: headers, encoding: JSONEncoding.default, includeBearerToken: includeBearerToken)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    if let afError = error as? AFError {
                        switch afError {
                        case .sessionTaskFailed(error: let error):
                            if let networkError = error as? NetworkError {
                                completion(.failure(networkError))
                            } else {
                                completion(.failure(error))
                            }
                        default:
                            completion(.failure(error))
                        }
                    } else {
                        completion(.failure(error))
                    }
                }
            }
    }
    
    func put<T: Decodable>(url: URLConvertible, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, includeBearerToken: Bool = true, completion: @escaping (Result<T, Error>) -> Void) {
        request(url: url, method: .put, parameters: parameters, headers: headers, encoding: JSONEncoding.default, includeBearerToken: includeBearerToken)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    if let afError = error as? AFError {
                        switch afError {
                        case .sessionTaskFailed(error: let error):
                            if let networkError = error as? NetworkError {
                                completion(.failure(networkError))
                            } else {
                                completion(.failure(error))
                            }
                        default:
                            completion(.failure(error))
                        }
                    } else {
                        completion(.failure(error))
                    }
                }
            }
    }
    
    func patch<T: Decodable>(url: URLConvertible, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, includeBearerToken: Bool = true, completion: @escaping (Result<T, Error>) -> Void) {
        request(url: url, method: .patch, parameters: parameters, headers: headers, encoding: JSONEncoding.default, includeBearerToken: includeBearerToken)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    if let afError = error as? AFError {
                        switch afError {
                        case .sessionTaskFailed(error: let error):
                            if let networkError = error as? NetworkError {
                                completion(.failure(networkError))
                            } else {
                                completion(.failure(error))
                            }
                        default:
                            completion(.failure(error))
                        }
                    } else {
                        completion(.failure(error))
                    }
                }
            }
    }
    
    func delete<T: Decodable>(url: URLConvertible, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, includeBearerToken: Bool = true, completion: @escaping (Result<T, Error>) -> Void) {
        request(url: url, method: .delete, parameters: parameters, headers: headers, encoding: JSONEncoding.default, includeBearerToken: includeBearerToken)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    if let afError = error as? AFError {
                        switch afError {
                        case .sessionTaskFailed(error: let error):
                            if let networkError = error as? NetworkError {
                                completion(.failure(networkError))
                            } else {
                                completion(.failure(error))
                            }
                        default:
                            completion(.failure(error))
                        }
                    } else {
                        completion(.failure(error))
                    }
                }
            }
    }
    
    private func request(url: URLConvertible, method: HTTPMethod, parameters: Parameters?, headers: HTTPHeaders?, encoding: ParameterEncoding, includeBearerToken: Bool) -> DataRequest {
        var authHeaders = headers ?? HTTPHeaders()
        if includeBearerToken {
            // Add Bearer token to headers
            if let token = UserDefaults.standard.string(forKey: "access_token") {
                authHeaders.add(name: "Authorization", value: "Bearer \(token)")
            }
        }
        return manager.request(url, method: method, parameters: parameters, encoding: encoding, headers: authHeaders)
    }
}
