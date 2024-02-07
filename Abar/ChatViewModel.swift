//
//  ChatViewModel.swift
//  Abar
//
//  Created by Reema Alsmari on 05/02/2024.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var response: String = ""
    private let service = OpenAIService.shared

    func fetchResponse(prompt: String) {
        Task {
            do {
                let result = try await service.sendPromptToChatGPT(
                    model: "gpt-3.5-turbo-instruct",
                    prompt: prompt,
                    maxTokens: 100,
                    temperature: 0.7
                )
                DispatchQueue.main.async {
                    self.response = result
                }
            } catch {
                DispatchQueue.main.async {
                    self.response = "Error: \(error.localizedDescription)"
                }
            }
        }
    }
}

