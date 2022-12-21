import SwiftUI

struct LocationsListView: View {

    @EnvironmentObject private var viewModel: LocationViewModel

    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                Button {
                    viewModel.updateMapLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical, 5)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationViewModel())
    }
}

extension LocationsListView {

    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .cornerRadius(20)
                    .shadow(color: .secondary, radius: 20)
            }

            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
