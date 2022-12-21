import SwiftUI

struct LoadingView: View {
    var body: some View {
        // a loading icon is displayed when the process takes time
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .mint))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
