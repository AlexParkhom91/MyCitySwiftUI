import MapKit
import SwiftUI

struct LocationDetailView: View {

    @EnvironmentObject private var viewModel: LocationViewModel
    let location: Location

    var body: some View {
        ScrollView {
            VStack {
                imageSection

                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapSection
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            backButton
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationViewModel())
    }
}

extension LocationDetailView {

    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 500)
        .shadow(color: .black.opacity(0.3), radius: 20, y: 10)
    }

    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
    }

    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }

    private var mapSection: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )), annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationPointView()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
    }

    private var backButton: some View {
        Button {
            viewModel.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .foregroundColor(.primary)
                .padding()
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding()
        }
    }
}
