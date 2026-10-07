import SwiftUI

struct TimeBadgeViewScreenView: View {
    @Binding var date: Date

    var body: some View {
        Text(android.text.format.DateUtils.getRelativeTimeSpanString((date).time).toString())
            .font(androidx.compose.ui.text.TextStyle(fontSize: 10, fontWeight: FontWeight.Bold, fontFamily: androidx.compose.ui.text.font.FontFamily.SansSerif))
            .foregroundColor(MaterialTheme.colorScheme.onSurfaceVariant)
    }
}
