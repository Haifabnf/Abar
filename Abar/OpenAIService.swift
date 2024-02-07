//
//  OpenAIService.swift
//  Abar
//
//  Created by Reema Alsmari on 05/02/2024.
//

import SwiftUI
import Foundation
import OpenAISwift


// Define the HTTP methods your service will use
enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
}

// Define the payload structure for your API request
struct GPTChatPayload: Encodable {
    let model: String
    let prompt: String
    let max_tokens: Int
    let temperature: Double
}

// OpenAI service class to handle API requests
class OpenAIService {
    
    static let shared = OpenAIService()
    private let apiKey = "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" // Replace with your actual API Key
    
    private init() { }
    
    private func generateURLRequest(httpMethod: HTTPMethod, payload: GPTChatPayload) throws -> URLRequest {
        guard let url = URL(string: "https://api.openai.com/v1/completions") else {
            throw URLError(.badURL)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        let jsonData = try JSONEncoder().encode(payload)
        urlRequest.httpBody = jsonData
        
        return urlRequest
    }
    
    // Function to send a prompt to ChatGPT and return the response
    func sendPromptToChatGPT(model: String, prompt: String, maxTokens: Int, temperature: Double) async throws -> String {
        let payload = GPTChatPayload(
            model: "gpt-3.5-turbo-instruct",
            prompt: prompt,
            max_tokens: maxTokens,
            temperature: temperature
        )
        let urlRequest = try generateURLRequest(httpMethod: .post, payload: payload)
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        struct Response: Decodable {
            struct Choice: Decodable {
                let text: String
            }
            let choices: [Choice]
        }
        
        let decoder = JSONDecoder()
        let response = try decoder.decode(Response.self, from: data)
        return response.choices.first?.text ?? "No response"
    }
}

// SwiftUI view to interact with the OpenAIService


// Main App struct to run the SwiftUI app

