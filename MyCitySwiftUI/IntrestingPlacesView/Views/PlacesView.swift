import MapKit
import SwiftUI

struct PlacesView: View {
    @EnvironmentObject private var viewModel: PlacesViewModel
    let maxWidth: CGFloat = 600

    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()

            VStack(spacing: 0) {
                header
                    .padding()
                    .frame(maxWidth: maxWidth)
                Spacer()
                locationsPreviewStack
            }
        }
        .sheet(item: $viewModel.sheetLocation, onDismiss: nil) { location in
            PlaceDetailView(location: location)
        }
    }
}

struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView()
            .environmentObject(PlacesViewModel())
    }
}

extension PlacesView {

    private var mapLayer: some View {
        Map(coordinateRegion: $viewModel.mapRegion,
            annotationItems: viewModel.locations,
            annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationPointView()
                        .scaleEffect(viewModel.mapLocation == location ? 1.0 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            viewModel.updateMapLocation(location: location)
                        }
                }
            })
    }

    private var header: some View {
        VStack {
            Button(action: viewModel.toggleShowLocationsList) {
                Text("\(viewModel.mapLocation.name)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: viewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle.degrees(viewModel.showLocationsList ? 180 : 0))
                    }
            }

            if viewModel.showLocationsList {
                PlacesListView()
            }
        }
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
    }

    private var locationsPreviewStack: some View {
        ZStack {
            ForEach(viewModel.locations) { location in
                if viewModel.mapLocation == location {
                    PlacePreviewView(location: location)
                        .shadow(color: .black.opacity(0.3), radius: 20)
                        .padding()
                        .frame(maxWidth: maxWidth)
                        .frame(maxWidth: .infinity)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
                }
            }
        }
    }
}
