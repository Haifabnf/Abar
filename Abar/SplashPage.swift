

import SwiftUI
import WebKit

import SwiftUI

struct SplashPage: View {
    @State private var isActive = false
    @State private var opacity = 0.1
    private let topPadding: CGFloat = 230
    private let animationDuration: Double = 1
    private let transitionDelay: Double = 6

    var body: some View {
        if isActive {
            ContentView()
        } else {
            splashScreenContent
        }
    }

    private var splashScreenContent: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    GifImage("SplashPage")
                        .opacity(opacity)
                        .animation(.easeIn(duration: animationDuration), value: opacity)
                        .onAppear {
                            opacity = 1.0
                        }
                }
                .padding(.top, topPadding)
            }
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + transitionDelay) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashPage_Previews: PreviewProvider {
    static var previews: some View {
        SplashPage()
    }
}
