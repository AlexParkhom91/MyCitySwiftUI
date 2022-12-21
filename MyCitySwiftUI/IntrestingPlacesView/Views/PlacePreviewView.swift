import SwiftUI

struct PlacePreviewView: View {
    @EnvironmentObject var viewModel: PlacesViewModel
    let location: Place

    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }

            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(.ultraThinMaterial)
            .offset(y: 65))
        .cornerRadius(10)
    }
}

struct PlacePreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.mint.ignoresSafeArea()

            PlacePreviewView(location: PlacesLocationData.Places.first!)
                .padding()
        }
        .environmentObject(PlacesViewModel())
    }
}

extension PlacePreviewView {

    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .cornerRadius(20)
            }
        }
        .padding(6)
        .background(.white)
        .cornerRadius(20)
    }

    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var learnMoreButton: some View {
        Button {
            viewModel.sheetLocation = location
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
    }

    private var nextButton: some View {
        Button(action: viewModel.handleNextButtonPress) {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
        .buttonBorderShape(.capsule)
    }
}
