import Foundation
import MapKit

struct Location: Identifiable, Equatable {

    let name: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]

    var id: String {
        name
    }

    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
