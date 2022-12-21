import Foundation
import MapKit
import SwiftUI

class PlacesViewModel: ObservableObject {

    @Published var locations: [Place] = []
    @Published var mapLocation: Place {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }

    @Published var mapRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    @Published var showLocationsList = false
    @Published var sheetLocation: Place? = nil

    init() {
        let locations = PlacesLocationData.Places
        self.locations = locations
        self.mapLocation = locations.first!
        updateMapRegion(location: locations.first!)
    }

    func updateMapLocation(location: Place) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }

    private func updateMapRegion(location: Place) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }

    func toggleShowLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }

    func handleNextButtonPress() {
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else { return }
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else { return }
            updateMapLocation(location: firstLocation)
            return
        }
        let nextLocation = locations[nextIndex]
        updateMapLocation(location: nextLocation)
    }
}
