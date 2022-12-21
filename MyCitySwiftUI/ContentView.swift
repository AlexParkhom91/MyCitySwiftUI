import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.mint, .blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                VStack {
                    Text("BobruiskApp")
                        .bold()
                        .foregroundColor(.indigo)
                        .font(.largeTitle)
                    Image("bobrLogo")
                        .resizable()
                        .frame(width: 300, height: 450)
                        .cornerRadius(35)
                        .opacity(0.9)
                        .padding(.bottom)
                    NavigationLink("Let's begin") {
                        MainView()
                    }
                    .foregroundColor(.cyan)
                    .tint(.cyan)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
