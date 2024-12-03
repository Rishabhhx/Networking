//
//  ErrorHandler.swift
//  Networking
//
//  Created by Rishabh Sharma on 04/11/24.
//

import Foundation

// Define custom error types
enum NetworkError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case serverError
    case unknown
    case customError(String)
}

class ErrorHandler {
    static func handle(error: Error) {
        if let networkError = error as? NetworkError {
            switch networkError {
            case .badRequest:
                showAlert("Bad request - The server could not understand the request due to invalid syntax.")
            case .unauthorized:
                showAlert("Unauthorized - Please check your credentials.")
            case .forbidden:
                showAlert("Forbidden - You do not have permission to access this resource.")
            case .notFound:
                showAlert("Not Found - The requested resource could not be found.")
            case .serverError:
                showAlert("Server Error - There was an issue on the server's end.")
            case .customError(let message):
                showAlert("Error: \(message)")
            case .unknown:
                showAlert("An unknown error occurred.")
            }
        } else {
            // Handle other types of errors (e.g., decoding issues)
            showAlert("An unexpected error occurred: \(error.localizedDescription)")
        }
    }
    
    private static func showAlert(_ message: String) {
        // Here you can show an alert, log the error, or perform any other user notification
        print(message) // Placeholder for actual alert presentation logic
    }
}
