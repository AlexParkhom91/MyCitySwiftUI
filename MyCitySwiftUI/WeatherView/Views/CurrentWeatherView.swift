import SwiftUI

struct CurrentWeatherView: View {

    var weatherManager = WeatherManager()
    @State var weather: WeatherBody?

    var body: some View {
        ZStack(alignment: .topLeading) {
            // decoding the data from response into weather struct
            if let weatherforecast = weather {
                VStack(alignment: .leading) {
                    VStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(weatherforecast.name)
                                .bold()
                                .font(.title)

                            Text("Today,\(Date().formatted(.dateTime.month().day().hour().minute()))")
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        VStack {
                            HStack {
                                VStack(spacing: 20) {
                                    Image(systemName: "\(weatherforecast.weather[0].conditionIcon)")
                                        .font(.system(size: 40))
                                        .foregroundColor(.white)

                                    Text("\(weatherforecast.weather[0].main)")
                                        .foregroundColor(.secondary)
                                }
                                .frame(width: 150, alignment: .leading)

                                Spacer()

                                Text(weatherforecast.main.temp.roundDouble() + "°")
                                    .font(.system(size: 70))
                                    .fontWeight(.bold)
                                    .padding()
                                    .foregroundColor(.white)
                            }
                            Spacer()
                                .frame(height: 50)

                            Spacer()
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            } else {
                LoadingView()
                    .task {
                        do {
                            // api call request
                            weather = try await weatherManager.getCurrentWeather()
                        } catch {
                            print("Error getting weather: \(error)")
                        }
                    }
            }
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
    }
}

extension Double {
    func roundDouble() -> String {
        String(format: "%.0f", self)
    }
}
