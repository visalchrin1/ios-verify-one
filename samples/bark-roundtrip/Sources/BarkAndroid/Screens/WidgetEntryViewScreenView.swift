import SwiftUI

struct WidgetEntryViewScreenView: View {
    @Binding var entry: Provider.Entry

    var body: some View {
        ZStack(contentAlignment: Alignment.TopStart)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
