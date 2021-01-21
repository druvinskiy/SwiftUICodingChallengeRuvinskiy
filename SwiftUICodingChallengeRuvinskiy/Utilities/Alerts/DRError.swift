//
//  DRError.swift
//  SwiftUICodingChallengeRuvinskiy
//
//  Created by David Ruvinskiy on 1/19/21.
//

import Foundation

enum DRError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

enum ErrorScreens {
    static let somethingWentWrong = EmptyState(imageName: "unavailable-cloud", message: "Sorry, something went wrong.\nPlease try again later or contact support.")
}
