import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            LinearGradient(colors: [.mint, .purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                .opacity(0.8)
            VStack(alignment: .leading) {
                CurrentWeatherView()
                Text("Select category")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.mint)
                    .padding(.leading, 30)
                    .padding(.bottom, 30)
                HStack {
                    Label("Bobruisk Web-page", systemImage: "network")
                        .font(.headline)
                        .padding(.leading, 20)
                    NavigationLink("GO!") { BobruiskWebPage() }
                        .tint(.blue)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.capsule)
                        .controlSize(.large)
                        .padding(.leading)
                }
                HStack {
                    Label("Bobruisk Fortress", systemImage: "map.fill")
                        .font(.headline)
                        .padding(.leading, 20)
                    NavigationLink("GO!") { FortressView() }
                        .tint(.blue)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.capsule)
                        .controlSize(.large)
                        .padding(.leading, 33)
                }
                HStack {
                    Label("Interesting Plases", systemImage: "mappin.and.ellipse")
                        .font(.headline)
                        .padding(.leading, 20)
                    NavigationLink("GO!") {
                        PlacesView()
                    }
                    .tint(.blue)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    .padding(.leading, 33)
                }
                HStack {
                    Label("Cafe & Restraunt", systemImage: "fork.knife")
                        .font(.headline)
                        .padding(.leading, 20)
                    NavigationLink("GO!") {
                        LocationsView()
                    }
                    .tint(.blue)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    .padding(.leading, 44)
                }
                .padding(.bottom, 100)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
