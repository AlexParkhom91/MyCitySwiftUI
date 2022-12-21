import SwiftUI

struct LocationPointView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "mappin.and.ellipse")
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .foregroundColor(Color.accentColor)
        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPointView()
    }
}
