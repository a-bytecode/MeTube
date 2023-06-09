
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

    var body: some Scene { // TODO: EnviromentObject als übergeordneten Datentyp erstellen
        
        WindowGroup {
            SplashView()
//            MainView()
        }
    }
}
