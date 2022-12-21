import Foundation
import MapKit

class LocationsDataService {

    static let locations: [Location] = [
        Location(
            name: "Cafe L'Histoire",
            coordinates: CLLocationCoordinate2D(latitude: 53.13656, longitude: 29.22598),
            description: "Atmospheric cafe with traditional European cuisine",
            imageNames: [
                "hist1",
                "hist2",
                "hist3"
            ]
        ),
        Location(
            name: "Pizza Bravo",
            coordinates: CLLocationCoordinate2D(latitude: 53.13716, longitude: 29.22732),
            description: "A cafe where you can order pizza or a delicious and hearty lunch",
            imageNames: [
                "bravo1",
                "bravo2",
                "bravo3"
            ]
        ),
        Location(
            name: "Basilic restraunt",
            coordinates: CLLocationCoordinate2D(latitude: 53.14007, longitude: 29.22728),
            description: "Traditional Italian restaurant with a huge selection of delicious Italian dishes, including PIZZA",
            imageNames: [
                "basilic1",
                "basilic2",
                "basilic3"
            ]
        ),
        Location(
            name: "SushiLLka",
            coordinates: CLLocationCoordinate2D(latitude: 53.14386, longitude: 29.22827),
            description: "A good traditional Japanese restaurant with reasonable prices and with the possibility of ordering takeaway",
            imageNames: [
                "sushi1",
                "sushi2",
                "sushi3"
            ]
        ),
        Location(
            name: "Tourist restraunt",
            coordinates: CLLocationCoordinate2D(latitude: 53.15446, longitude: 29.24722),
            description: "Restaurant of European cuisine with a good selection of dishes, located in one of the hotels in the city on the banks of the river. There is an observation deck on the roof, with a picturesque view.",
            imageNames: [
                "turist1",
                "turist2",
                "turist3"
            ]
        ),
        Location(
            name: "Chirvonaya Vezha restraunt",
            coordinates: CLLocationCoordinate2D(latitude: 53.142583, longitude: 29.222452),
            description: "The restaurant is located in the city center, in an old water tower. Dishes of traditional Belarusian cuisine are presented.",
            imageNames: [
                "vezha1",
                "vezha2",
                "vezha3"
            ]
        ),
        Location(
            name: "Amsterdam",
            coordinates: CLLocationCoordinate2D(latitude: 53.165764, longitude: 29.188565),
            description: "Сafe which presents dishes of European and national Belarusian cuisine. spacious hall and a large number of tables.",
            imageNames: [
                "amst1",
                "amst2",
                "amst3"
            ]
        )
    ]
}
