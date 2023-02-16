//
//  NetworkError.swift
//  Sample HttpClient
//
//  Created by Manoj kumar on 16/02/23.
//

import Foundation

enum NetworkError: Error {
    case noInternetConnection
    case requestTimedOut
    case serverError
    case invalidResponse
    case unauthorized
    case forbidden
    case resourceNotFound
    case serializationError
    case genericError
}

extension NetworkError {
    var localizedDescription: String {
        switch self {
        case .noInternetConnection:
            return NSLocalizedString("No internet connection. Please check your network settings.", comment: "Network error: No internet connection")
        case .requestTimedOut:
            return NSLocalizedString("Request timed out. Please try again later.", comment: "Network error: Request timed out")
        case .serverError:
            return NSLocalizedString("Server error. Please try again later.", comment: "Network error: Server error")
        case .invalidResponse:
            return NSLocalizedString("Invalid server response. Please try again later.", comment: "Network error: Invalid server response")
        case .unauthorized:
            return NSLocalizedString("You are not authorized to perform this action. Please log in or contact support.", comment: "Network error: Unauthorized")
        case .forbidden:
            return NSLocalizedString("Access to the requested resource is forbidden. Please contact support for assistance.", comment: "Network error: Forbidden")
        case .resourceNotFound:
            return NSLocalizedString("The requested resource could not be found. Please check the URL and try again.", comment: "Network error: Resource not found")
        case .serializationError:
            return NSLocalizedString("Error deserializing server response. Please try again later.", comment: "Network error: Serialization error")
        case .genericError:
            return NSLocalizedString("An error occurred. Please try again later.", comment: "Network error: Generic error")
        }
    }
}


/*
 These error cases cover some common scenarios that you might encounter when making network requests:

 noInternetConnection: The user is not connected to the internet.
 requestTimedOut: The network request took too long to complete.
 serverError: The server returned an error status code (e.g. 500).
 invalidResponse: The server response could not be parsed or was missing required data.
 unauthorized: The user is not authorized to perform the requested action.
 forbidden: The requested resource is forbidden and cannot be accessed.
 resourceNotFound: The requested resource could not be found.
 serializationError: There was an error converting the server response into a usable object.
 genericError: A catch-all error case for other types of errors that don't fit into the other categories.
 */
