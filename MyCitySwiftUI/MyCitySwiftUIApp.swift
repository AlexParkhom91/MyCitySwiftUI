import SwiftUI

@main
struct MyCitySwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(PlacesViewModel())
                .environmentObject(LocationViewModel())
        }
    }
}
