import SwiftUI

struct AlertHostView: View {
    // ONENATIVE-REVIEW (confidence: low): Local delegate `val alert by UiAlerts.current.collectAsState()` was not translated as a real binding — only `by remember { mutableStateOf(...) }}` (or its mutableIntStateOf/mutableLongStateOf/mutableFloatStateOf/mutableDoubleStateOf primitive variants) state round-trips to @State — a placeholder property was declared below so this screen's existing references to `alert` are at least declared; replace its type and add the real delegate logic manually.
    var alert: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val current = alert ?: return` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `current` are at least declared; replace its type and add the real logic manually.
    var current: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val values = remember(current) { mutableStateListOf<String>().also { list -> current.textFields.forEach { list.add(it.text ?: "") } } }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `values` are at least declared; replace its type and add the real logic manually.
    var values: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val cancel = current.actions.lastOrNull { it.style == UIAlertActionStyle.Cancel }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `cancel` are at least declared; replace its type and add the real logic manually.
    var cancel: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val others = current.actions.filter { it !== cancel }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `others` are at least declared; replace its type and add the real logic manually.
    var others: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val dismissCancel: () -> Unit = { UiAlerts.dismiss(current); cancel?.handler?.invoke(cancel) }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `dismissCancel` are at least declared; replace its type and add the real logic manually.
    var dismissCancel: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val color = if (action.style == UIAlertActionStyle.Destructive) MaterialTheme.colorScheme.error else Color.Unspecified` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `color` are at least declared; replace its type and add the real logic manually.
    var color: Any?

    var body: some View {
        VStack {
            fun()
            choose(action: UIAlertAction) {
                current()
                // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                // .textFields.forEachIndexed { index, field -> field.text = values.getOrNull(index) }
                //         UiAlerts.dismiss(current)
                //         action.handler?.invoke(action)
                EmptyView()
            }
            @Composable()
            fun()
            Body {
                current()
                // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                // .message?.let { Text(it, style = MaterialTheme.typography.bodyMedium) }
                //         current.textFields.forEachIndexed { index, field ->
                //             OutlinedTextField(
                //                 value = values.getOrElse(index) { "" },
                //                 onValueChange = { if (index < values.size) values[index] = it },
                //                 placeholder = field.placeholder?.let { hint -> @Composable { Text(hint) } },
                //                 singleLine = true,
                //                 modifier = Modifier.fillMaxWidth().padding(top = 8.dp),
                //             )
                //         }
                EmptyView()
            }
            @Composable()
            fun()
            Buttons {
                ForEach(others + listOfNotNull(cancel), id: \.self) { action in
                    TextButton(onClick: { choose(action) }) {
                        Text(action.title ?? "")
                            .foregroundColor(color)
                    }
                        .frame(maxWidth: .infinity)
                }
            }
            if current.preferredStyle == UIAlertControllerStyle.ActionSheet {
                ModalBottomSheet(onDismissRequest: dismissCancel) {
                    VStack(Modifier.fillMaxWidth().padding(horizontal: 16).padding(bottom: 24), spacing: 4) {
                        current()
                        // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                        // .title?.let { Text(it, style = MaterialTheme.typography.titleMedium) }
                        //                 Body()
                        //                 Buttons()
                        EmptyView()
                    }
                }
            }
            else {
                AlertDialog({ Column { Body(); Buttons() } }, onDismissRequest: dismissCancel, properties: DialogProperties(dismissOnClickOutside: false), title: current.title?.let { heading -> @Composable { Text(heading) } }, confirmButton: {})
            }
        }
    }
}
