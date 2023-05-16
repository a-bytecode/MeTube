
import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
    return true
  }
}

@main
struct MeTubeApp: App {
    //Registration für Firebase Setup!
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    @StateObject var viewModel : MeTubeViewModel = MeTubeViewModel()
    @StateObject var fbViewModel = FirebaseViewModel()
    @State private var searchTerm = ""
    @State private var input = ""

    var body: some Scene { // TODO: EnviromentObject als übergeordneten Datentyp erstellen
        
        WindowGroup {

            NavigationStack {
                LoginView()
                    .environmentObject(fbViewModel)
                    .environmentObject(viewModel)
                    .onAppear {
                        fbViewModel.checkUser()
                    }
                NavigationLink(destination: SearchView(input: input, searchTerm: searchTerm)
                    .environmentObject(viewModel)
                    .environmentObject(fbViewModel), isActive: $fbViewModel.isLoggedIn) {
                    EmptyView()
                }
            }
        }
    }
}
