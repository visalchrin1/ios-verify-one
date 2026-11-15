import SwiftUI

struct WidgetHeaderViewScreenView: View {
    @Binding var title: String
    @Binding var icon: String?

    var body: some View {
        HStack(spacing: 4, verticalAlignment: Alignment.CenterVertically) {
            if let icon = icon {
                Image(systemName: "info.circle")
            }
            Text(title)
                .font(androidx.compose.ui.text.TextStyle(fontSize: 13, fontWeight: FontWeight.Bold, fontFamily: androidx.compose.ui.text.font.FontFamily.SansSerif))
                .foregroundColor(MaterialTheme.colorScheme.onSurface)
                .lineLimit(1)
        }
    }
}
