import SwiftUI

struct NotYetPortedScreenView: View {
    @Binding var name: String

    var body: some View {
        VStack(verticalArrangement: Arrangement.Center, horizontalAlignment: Alignment.CenterHorizontally) {
            Text(name, textAlign: TextAlign.Center)
                .font(.title3)
            Text("This screen has not been ported yet. See CONVERSION_REPORT.md.", textAlign: TextAlign.Center)
                .font(.callout)
                .padding(top: 8)
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(24)
    }
}
