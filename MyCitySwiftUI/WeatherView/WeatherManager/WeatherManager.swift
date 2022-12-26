import Foundation

enum API {
    static let key = "aa3cd33f76dd81309d437fa26151a302"
}

class WeatherManager {
    // Bobruisk latitude and longitude
    private let latitute = 53.1384
    private let longitude = 29.2214

    // API URL
    let currentWeatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(API.key)"

    // Function for home screen to ger current weather

    func getCurrentWeather() async throws -> WeatherBody {

        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitute)&lon=\(longitude)&appid=\(API.key)&units=metric") else {
            fatalError("Missing URL ")
        }

        let urlRequest = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather Data") }

        let decodedData = try JSONDecoder().decode(WeatherBody.self, from: data)

        return decodedData
    }
}
