import MapKit
import SwiftUI

struct PlaceDetailView: View {

    @EnvironmentObject private var vm: PlacesViewModel
    let location: Place

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

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(location: PlacesLocationData.Places.first!)
            .environmentObject(PlacesViewModel())
    }
}

extension PlaceDetailView {

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
            vm.sheetLocation = nil
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
