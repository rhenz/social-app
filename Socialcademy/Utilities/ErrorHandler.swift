//
//  ErrorHandler.swift
//  Socialcademy
//
// Created by John Salvador 
//

import Foundation

@MainActor
protocol ErrorHandler: AnyObject {
    var error: Error? { get set }
}

extension ErrorHandler {
    func withErrorHandlingTask(perform action: @escaping () async throws -> Void) {
        Task {
            do {
                try await action()
            } catch {
                print("[\(Self.self)] Error: \(error)")
                self.error = error
            }
        }
    }
}
