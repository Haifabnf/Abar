import SwiftUI
import WebKit

struct SplashPage: View {
    @State private var isActive = false
    @State private var opacity = 0.1
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            GeometryReader { geometry in
                ZStack {
                  
                    VStack {
                      
                        
                        GifImage("SplashPage")
                            
                            .opacity(opacity)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1)) {
                                    self.opacity = 1.0
                                }
                            }
                        
                        Spacer()
                    }
                }
                .edgesIgnoringSafeArea(.all) // Ignore safe area to cover the status bar and safe area inset
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        withAnimation {
                            self.isActive = true
                        }
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
