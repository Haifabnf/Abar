//
//  AIview.swift
//  Abar
//
//  Created by Reema Alsmari on 05/02/2024.
//

import SwiftUI
import Foundation

struct AIview: View {
    @State private var prompt: String = ""
    @State private var response: String = "With AI you can express your words and feelings even better!! for example: ''i want to say happy birthday for my friend nouf.'' "
    
    var body: some View {
        
       
        
        VStack {
            TextField("Ask AI to help you express...", text: $prompt)
                .padding()
            
            
            
            Button("Ask") {
                Task {
                    do {
                        response = try await OpenAIService.shared.sendPromptToChatGPT(model: "gpt-3.5-turbo-instruct", prompt: prompt, maxTokens: 100, temperature: 0.5)
                    } catch {
                        response = "An error occurred: \(error)"
                    }
                }
            }
            .padding()
            
            ScrollView {
                Text(response)
                    .padding()
                    .foregroundColor(.gray)
                    .fontWeight(.regular)
                
            }
            
        }
        .padding()
    }
}

#Preview {
    AIview()
}
