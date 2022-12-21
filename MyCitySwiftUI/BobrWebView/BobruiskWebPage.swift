import SwiftUI
import WebKit

struct BobruiskWebPage: View {

    let myWebView = MyWebView(request: URLRequest(url: URL(string: "https://bobr.by")!))
    var body: some View {
        VStack {
            myWebView
            HStack {
                Button {
                    myWebView.goBack()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 25,
                                      weight: .semibold,
                                      design: .rounded))
                }
                .padding(.trailing, 60)

                Button {
                    myWebView.refresh()
                } label: {
                    Image(systemName: "goforward")
                        .font(.system(size: 25,
                                      weight: .semibold,
                                      design: .rounded))
                }
            }
            .padding(.top, 12)
        }
    }
}

struct BobruiskWebPage_Previews: PreviewProvider {
    static var previews: some View {
        BobruiskWebPage()
    }
}

struct MyWebView: UIViewRepresentable {

    let myWebView: WKWebView?
    let webRequest: URLRequest

    init(request: URLRequest) {
        self.myWebView = WKWebView()
        self.webRequest = request
    }

    func makeUIView(context: Context) -> WKWebView {
        myWebView!
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        myWebView?.load(webRequest)
    }

    func goBack() {
        myWebView?.goBack()
    }

    func refresh() {
        myWebView?.reload()
    }
}
