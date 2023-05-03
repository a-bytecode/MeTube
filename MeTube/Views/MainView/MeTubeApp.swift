
import SwiftUI

@main
struct MeTubeApp: App {
    @StateObject var viewModel : MeTubeViewModel = MeTubeViewModel()
    var body: some Scene { // TODO: EnviromentObject als übergeordneten Datentyp erstellen
        
        WindowGroup {
            MeTubeView()
                .environmentObject(viewModel)
        }
    }
}
