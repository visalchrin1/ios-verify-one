import SwiftUI

struct SectionViewControlleriPadScreenView: View {
    @Binding var onBack: () -> Unit
    @Binding var navigate: (String) -> Unit

    var body: some View {
        NotYetPortedScreenView("SectionViewController_iPadScreen")
    }
}
