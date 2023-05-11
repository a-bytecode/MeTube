
import SwiftUI

@main
struct MeTubeApp: App {
    
    @StateObject var viewModel : MeTubeViewModel = MeTubeViewModel()
    @State private var searchTerm = ""
    @State private var input = ""
    @State private var isSheetOpen = false

    var body: some Scene { // TODO: EnviromentObject als übergeordneten Datentyp erstellen
        
        WindowGroup {
            SearchView(input: input, searchTerm: searchTerm)
                .environmentObject(viewModel)
        }
    }
}
