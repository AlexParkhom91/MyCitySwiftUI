import Foundation

// Model of the response body we get from calling the OpenWeather API for current weather

struct WeatherBody: Decodable {
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String

    struct WeatherResponse: Decodable {
        var id: Int
        var main: String
        var description: String
        var icon: String

        var conditionIcon: String {
            switch id {
            case 200 ... 232:
                return "cloud.bolt"
            case 300 ... 321:
                return "cloud.drizzle"
            case 500 ... 531:
                return "cloud.rain"
            case 600 ... 622:
                return "cloud.snow"
            case 701 ... 781:
                return "cloud.fog"
            case 800:
                return "sun.max"
            case 801 ... 802:
                return "cloud.sun"
            case 803 ... 804:
                return "cloud.moon"
            default:
                return "cloud"
            }
        }
    }

    struct MainResponse: Decodable {
        var temp: Double
    }
}

struct WeatherResponse: Decodable {
    var id: Int
    var main: String
    var icon: String
    // a switch case to select icon based on the weather condition codes in OpenweatherMap
    // https://openweathermap.org/weather-conditions

    var conditionIcon: String {
        switch id {
        case 200 ... 232:
            return "cloud.bolt"
        case 300 ... 321:
            return "cloud.drizzle"
        case 500 ... 531:
            return "cloud.rain"
        case 600 ... 622:
            return "cloud.snow"
        case 701 ... 781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801 ... 802:
            return "cloud.sun"
        case 803 ... 804:
            return "cloud.moon"
        default:
            return "cloud"
        }
    }
}
