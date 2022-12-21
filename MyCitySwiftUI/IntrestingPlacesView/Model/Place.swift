import Foundation
import MapKit

struct Place: Identifiable, Equatable {

    let name: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]

    var id: String {
        name
    }

    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.id == rhs.id
    }
}
