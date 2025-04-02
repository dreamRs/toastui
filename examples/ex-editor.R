# Default is markdown editor with tab to switch to preview
editor()
# equivalent to
editor(previewStyle = "tab")
# Show preview side by side
editor(previewStyle = "vertical")

# Default edit type is markdown
editor(initialEditType = "markdown")
# Change to wysiwyg and remove switch mode option
editor(initialEditType = "wysiwyg", hideModeSwitch = TRUE)
